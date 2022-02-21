// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lw_server/helpers/Global.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        toolbarHeight: size.height / 5,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 26),
        title: const Text("Establish connection"),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Padding(
                padding: EdgeInsets.only(top: size.height / 4),
                child: Text(
                  "Type the address below in your desktop client",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height / 10),
                child: Text(
                  "Server running on $ADDRESS:$PORT",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Connect",
                  // style: Theme.of(context).textTheme.headline5,
                ),
              )),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text("Trial"), accountEmail: Text("data"))
          ],
        ),
      ),
    );
  }
}
