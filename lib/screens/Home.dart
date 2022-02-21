import 'package:flutter/material.dart';
import 'package:lw_server/models/Server.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///  Server server = Server(404).getInstance;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: Text("Welcome"))),
    );
  }
}
