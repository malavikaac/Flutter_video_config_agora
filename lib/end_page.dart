import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CallEnded extends StatelessWidget {
  const CallEnded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 500),
            
            child: Container(
              height: 600,width: 800,
              
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                   Text('Thank you', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                   ),),
                   SizedBox(height: 20),
                    Text('Call Ended...', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                   ),)
                  ],
                ),
              )
              
            ),
          )
        ],
      ),
    );
}
}