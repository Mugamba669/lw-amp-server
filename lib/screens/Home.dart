// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lw_server/Core/Server.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'package:r_get_ip/r_get_ip.dart';

class Home extends StatefulWidget {
  final bool checker;
  const Home({Key? key, required this.checker}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> store = [];

  TextStyle styles = const TextStyle(
    // color: Colors.,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  @override
  void initState() {
    super.initState();
    FlutterAudioQuery().getSongs().then((value) => {
          for (var i = 0; i < value.length; i++)
            {
              print(value[i].filePath),
              store.add(json.encode(value[i].filePath))
            }
        });
    // List.generate(length, (index) => null)
  }

  Widget _buildIpWidget(BuildContext context, AsyncSnapshot<String?> snapshot) {
    return snapshot.hasData
        ? Text(
            "Server running on ${snapshot.data}",
            style: styles,
          )
        : Text(
            "Ensure that your hotspot and data conection is on..",
            style: styles,
          );
  }

  Widget generateData(BuildContext context, AsyncSnapshot<SongInfo?> snapshot) {
    // var n = snapshot
    return snapshot.hasData
        ? Text(
            "Server running on ${snapshot.data}",
            style: styles,
          )
        : Text(
            "Ensure that your hotspot and data conection is on..",
            style: styles,
          );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        toolbarHeight: size.height / 5,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
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
                        fontSize: 16,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height / 10),
                // ignore: unrelated_type_equality_checks
                child: widget.checker == true
                    ? FutureBuilder(
                        future: RGetIp.internalIP,
                        builder: _buildIpWidget,
                      )
                    : const Text(
                        "Server session ended...",
                        // style: Theme.of(context).textTheme.headline6!.copyWith(
                        //       fontSize: 18,
                        //     ),
                      ),
              ),
              widget.checker
                  ? Center(
                      child: ElevatedButton(
                        onPressed: () {
                          StorageServer.send(store);
                          // StorageServer.closeConnection();
                        },
                        child: const Text(
                          "Send Data",
                          // style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    )
                  : const Text(""),
              // FutureBuilder(
              //   future: FlutterAudioQuery().getSongs(),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     store = snapshot.data;
              //     return Text("");
              //   },
              // ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
                accountName: Text("Trial"), accountEmail: Text("data"))
          ],
        ),
      ),
    );
  }
}
