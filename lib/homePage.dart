import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_demo/end_page.dart';


class MyAppName extends StatefulWidget {
  const MyAppName({Key? key}) : super(key: key);

  @override
  State<MyAppName> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppName> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "5a816acb5c3a4a7ebf81013e17e08b8f",
      channelName: "d",
      username: "user",
    ),
  );

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
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: false,
                onDisconnect: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context){
                    return CallEnded();
                  }));
                }, // Add this to enable screen sharing
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}