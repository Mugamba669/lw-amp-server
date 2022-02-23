import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageServer {
  static ServerSocket? server;

  // establishing a tcp connection
  static void bindTo(int port) async {
    try {
      server = await ServerSocket.bind(InternetAddress.anyIPv4, port,
          backlog: 10, shared: true);
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

// sending chuncks of data
  static void send(msg) async {
    server!.listen((client) {
      client.write(Directory("/storage/emulated/0/").listSync());
      if (kDebugMode) {
        print(client.remoteAddress);
      }
      client.close();

      client.listen((event) {
        if (kDebugMode) {
          print(String.fromCharCodes(event));
        }
      });
    }, onError: ((handleError) {
      if (kDebugMode) {
        print(handleError);
      }
    }), onDone: (() {
      server!.close();
    }));
  }
// checking for conection

  static Future<bool> isConnected() async {
    // ignore: unnecessary_null_comparison
    return server == null ? false : true;
  }

  static dynamic receive() {
    server!.listen((client) {
      client.listen((response) {
        if (kDebugMode) {
          print(String.fromCharCodes(response));
        }
      });
    });
  }

  static closeConnection() async {
    await server!.close();
  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  return false;
}
