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
      appId: "947fb1de526d429b92bef85fbf6864b0",
      channelName: "r",
      username: "user",
      tempToken: '007eJxTYNgha5D5zl837P+P/0Fn/Z39DEp7bk0yqK73+Pqkcbqk2EYFBgtTi0QLI7NUyyQTS5PUlCRLs2RLc/MUQwNjSyMj05SkRGerlIZARgaeH88ZGRkgEMRnZChiYAAA9OoeCA==',
      screenSharingEnabled: true,
      
    ),
    agoraChannelData: AgoraChannelData(
      isActiveSpeakerDisabled: false,
      channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
    )
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
             
              AgoraVideoButtons(
                client: client,
                addScreenSharing: true,
                onDisconnect: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context){
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
               Align(
                alignment: Alignment.center,
                 child: Container(
                  height:600,
                  width: 600,
                  color: Colors.amberAccent,
                 ),
               ), 
                  
               Align(
                alignment: Alignment.centerRight,
                 child: Container(
                  height: 500,
                  width: 500,
                  color: Color.fromARGB(255, 184, 182, 179),
                  
                 ),
               )
      
      
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}