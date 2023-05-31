import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'dart:async';
import 'socketmanger.dart';
void main()async {
  runApp(MyApp());
  SocketManager();
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterTts ftts = FlutterTts();
  void initTts_E() {
    ftts.setLanguage('English');
    ftts.speak('Welcome to the blind assistance system');
  }
  void initState() {
    super.initState();
    initTts_E();
    Timer(Duration(seconds:3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                welcome()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/images/hello.png"),
              fit: BoxFit.fill,
            ),
          ),

    );
  }
}