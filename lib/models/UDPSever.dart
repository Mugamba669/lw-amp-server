import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lw_server/helpers/Global.dart';

class UDPServer {
  RawDatagramSocket? datagram;

  UDPServer(this.datagram);

  Future<UDPServer> bind() async {
    final socket = await RawDatagramSocket.bind(HOST, PORT, reusePort: true);
    return UDPServer(socket);
  }

  Future<int> send(String message) async {
    return datagram!.send(ascii.encode(message), HOST, PORT);
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

/// UDP-Server
class Server {
  static UDPServer? client;
//**Checks if the server is connected */
  static bool isConnected() {
    if (client != null) return true;
    return false;
  }

  /// Allows connection to be established
  static void connectServer() async {
    await client!.bind();
  }

  /// Performs the send of data to the client
  static Future<int> send(message) async {
    if (client!.datagram != null) {
      return client!.datagram!.send(ascii.encode(message), HOST, PORT);
    }
    return 0;
  }

  /// Closes the server connection
  static close() {
    client!.datagram!.close();
  }
}
