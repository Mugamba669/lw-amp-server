import 'dart:convert';
import 'dart:io';

import 'package:lw_server/helpers/Global.dart';

void main() async {
  // bind the socket server to an address and port
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, PORT);
  Directory dir = Directory('/home/blabs/Music/UG');

  List<FileSystemEntity> dirs = dir.listSync();
  List<String> temp = [];
  for (var item in dirs) {
    temp.add(item.path);
  }
  // listen for clent connections to the server
  server.listen((client) {
    client.write(json.encode(temp));
    print('Connection from'
        ' ${client.remoteAddress.address}:${client.remotePort}');
    // handleConnection(client);
  });
}
