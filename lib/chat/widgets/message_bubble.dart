import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, 
  this.profileImageUrl, 
  this.message, 
  this.date});

  final String? profileImageUrl;
   final String? message;
    final String? date;

  @override
  Widget build(BuildContext context) {
    final isReceiver = profileImageUrl !=null;
    return Row(
    mainAxisAlignment:isReceiver ?MainAxisAlignment.start:MainAxisAlignment.end,
    crossAxisAlignment:CrossAxisAlignment.end ,
    children: [
      if (isReceiver)
      Padding(padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent[100],
        foregroundImage: NetworkImage(profileImageUrl!),
      ),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: isReceiver ? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              constraints: BoxConstraints(maxWidth: 275),
              decoration: BoxDecoration(
                color: isReceiver ? Colors.green : Color.fromARGB(255, 218, 218, 218),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('message',
              style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height:8),
            Text('date',
            style:TextStyle(fontSize: 12) ,)
          ],
        ),
      ),
      if(!isReceiver) SizedBox(width: 12,)
    ],
    );
  }
}