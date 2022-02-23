import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Client {
  Socket? server;
  int port;
  Client(this.port);

  ///***Establishing the binding between the client and servers */
  Future<void> bindPort(BuildContext context) async {
    try {
      server = await Socket.connect(InternetAddress.anyIPv4, port);
    } on SocketException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Error ${e.message} on  port :: $port"),
        ),
      );
    }
  }

  get getInstance => server;

  ///*** This method sends the buffer response to client*/
  Future<void> send(BuildContext context, message) async {
    // ignore: unnecessary_null_comparison
    if (server == null) await bindPort(context);
    server!.write(message);
  }

  Future<void> receive(BuildContext context) async {
    server!.listen((event) {
      var data = event.buffer.toString();
      if (kDebugMode) {
        print(data);
      }
    });
  }

  //**This method closes the connection  */
  Future<void> closeConnection() async {
    await server!.close();
  }
}
