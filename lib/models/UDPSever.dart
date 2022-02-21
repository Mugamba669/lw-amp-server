import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lw_server/helpers/Global.dart';
// import '__init__.dart';

int i = 0;

class UDPServer {
  RawDatagramSocket? datagram;
  int port;
  UDPServer(this.datagram, this.port);

  Future<UDPServer> bind() async {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, PORT,
        reusePort: false);
    return UDPServer(socket, port);
  }

  Future<int> send(String message) async {
    return datagram!.send(ascii.encode(message), HOST, port);
  }

  void receive() async {
    datagram!.listen((event) {
      if (event == RawSocketEvent.read) {
        if (kDebugMode) {
          print(ascii.decode(datagram!.receive()!.data));
        }
      }
    }, onError: ((err) {
      if (kDebugMode) {
        print(err);
      }
    }), onDone: () {});
  }
}

class UDPServerImplementation {
  static UDPServer? client;

  static bool isConnected() {
    if (client != null) return true;
    return false;
  }

  static void connectToServer() async {
    // client = await UDPServer.bind();
  }

  static Future<int> send() async {
    if (client!.datagram != null) {
      return client!.datagram!
          .send(ascii.encode("message"), InternetAddress.anyIPv4, client!.port);
    }
    return 0;
  }

  static closeConnection() {
    client!.datagram!.close();
  }
}
