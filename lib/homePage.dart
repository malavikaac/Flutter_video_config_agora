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
      appId: "76a53762ebf04b9399798e81da38179b",
      channelName: "t",
      username: "user",
      tempToken: '007eJxTYFj6P7Xy+UXDJzmsWZd3W2Zt/Br7+FCVX3GfrdmVknjrxXcUGFLNDJItLAyMTMwSzU2MjMwtEy0NkpONE00sjAySEo1NvIvtUhoCGRnswhKYGRkgEMRnZChhYAAAYU4eew==',
      screenSharingEnabled: true,  
    ),
    agoraChannelData: AgoraChannelData(
      isActiveSpeakerDisabled: false,
      channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
    ),
    agoraEventHandlers: AgoraRtcEventHandlers(

      //onUserJoined: (int uid,int (connection, remoteUid, elapsed) => )
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
                extraButtons: [
                 ElevatedButton( 
           onPressed: () {},
           child: Icon(Icons.chat_sharp, color: Colors.blueAccent), // icon of the button
           style: ElevatedButton.styleFrom( // styling the button
             shape: CircleBorder(),
             padding: EdgeInsets.all(18),
             backgroundColor: Colors.white, // Button color
             foregroundColor: Colors.white, // Splash color
           ),
         ),
                ],
              ),
               Container(
                width: 300,
                height: 300,
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

      