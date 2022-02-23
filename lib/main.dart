import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lw_server/Core/Server.dart';
// import 'package:get/get_core/src/get_main.dart';

import 'package:lw_server/screens/Splash.dart';

import 'helpers/Global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  StorageServer.bindTo(PORT);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Splash(),
    );
  }
}
