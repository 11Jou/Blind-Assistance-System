import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vision/features.dart';
import 'socketmanger.dart';

class arabic extends StatelessWidget {
  FlutterTts ftts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    ftts.speak('اختر واحدة من الخصائص الموجودة');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/feature.png"),
            fit: BoxFit.fill,
          ),
        ),
        child:ListView(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          children:[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(300,0,0,150),
              leading: IconButton(
                icon: const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => features()
                    ),
                  );
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(13,30, 0,25),
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('7', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);
                          await ftts.setVolume(1.0);
                          await ftts.setPitch(1.0);
                          ftts.speak("التعرف على الأشياء");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'التعرف على الأشياء',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('9', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("قراءة النصوص");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'قراءة النصوص',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(13,60, 0,0),
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('1', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("التعرف على الأشخاص");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'التعرف على الأشخاص',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('5', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("التعرف على النقود");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 15, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'التعرف على النقود',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(13,90, 0,0),
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('3', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("التعرف على وصف المشهد");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'وصف المشاهد',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage('ara');
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('11', "ara");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("Arabic");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("التعرف على الطعام");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.w700)
                        ),
                        child :const Text( 'التعرف على الطعام',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}