import 'package:flutter/material.dart';
import 'package:flutter_call_demo/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: 600,
              width: 900,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 200, left: 150, right: 150),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter ID',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 70),
                      Container(
                          height: 50,
                          width: 180,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return MyAppName();
                                }));
                              },
                              child: Text(
                                'Join Call',
                                style: TextStyle(fontSize: 26),
                              )))
                    ],
                  )),
            ),
          ),
        ),
      ],
    ));
  }
}