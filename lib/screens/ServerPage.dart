import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lw_server/Core/Server.dart';
import 'package:lw_server/helpers/Global.dart';
import 'package:lw_server/models/UDPSever.dart';
import 'package:lw_server/screens/Home.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({Key? key}) : super(key: key);

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  //***Initiate the server */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            bool check = await StorageServer.isConnected();
            if (kDebugMode) {
              print(check);
            }
            check == true
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Home(checker: check),
                        fullscreenDialog: true),
                  )
                : const Text("data");
          },
          child: AvatarGlow(
            endRadius: 90,
            glowColor: Colors.black,
            child: PhysicalModel(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              elevation: 19,
              color: Colors.transparent,
              shadowColor: Colors.black,
              child: CircleAvatar(
                radius: 85,
                child: Text(
                  "Start Server",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
