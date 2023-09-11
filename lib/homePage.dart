import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_demo/chat/views/chatScreen.dart';
import 'package:flutter_call_demo/end_page.dart';

class MyAppName extends StatefulWidget {
  const MyAppName({Key? key}) : super(key: key);

  @override
  State<MyAppName> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppName> {
  final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "3659b9c2f7174bccb6a9d171edcb3d13",
        channelName: "m",
        username: "user",
        tempToken:
            '007eJxTYEi/sT9h8iFvKT8T/SmH4ng+vt1UdniXnVvdBhF2HSnHzxMUGIzNTC2TLJON0swNzU2SkpOTzBItUwzNDVNTkpOMUwyNQ+x2pTQEMjL4/ZdlYWSAQBCfkSGXgQEAwfMdeA==',
        screenSharingEnabled: true,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
        Permission.calendar
      ]);

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('2Way Audio-Video Communication'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoButtons(
                client: client,
                addScreenSharing: true,
                onDisconnect: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context) {
                    return CallEnded();
                  }));
                }, // Add this to enable screen sharing
              ),
              Container(
                width: 600,
                height: 600,
                child: AgoraVideoViewer(
                  client: client,
                  layoutType: Layout.floating,
                  enableHostControls: true,
                  // Add this to enable host controls
                ),
              ),
  
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
