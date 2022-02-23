// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lw_server/helpers/Global.dart';
import 'package:lw_server/screens/Home.dart';
import 'package:lw_server/screens/ServerPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ServerPage(),
          fullscreenDialog: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 81, 216),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/pAudio.png",
                    width: size.width / 3,
                    height: size.height / 3,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 5,
                child: Icon(
                  Icons.wifi,
                  size: size.width / 5,
                ),
              ),
              Center(
                  child: Text(
                "Welcome to Lw-server",
                style: Theme.of(context).textTheme.headline5,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
