import 'package:flutter/material.dart';
import 'package:flutter_call_demo/chat/widgets/message_text_field.dart';

import '../widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Chat') ,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 16), 
                reverse: true,
                itemBuilder: (BuildContext context, int index) => SizedBox.shrink(),
                 itemCount: 0, 
                 separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16,),
              ),
            ),
            const MessageTextField(),
          ],
        ),
    );
  }
}

const _messages = <MessageBubble>[
  MessageBubble(
    profileImageUrl: 'https://images.unsplash.com/photo-1677431532210-19204d5eee40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
  )
];