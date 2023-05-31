import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'arabic.dart';
import 'socketmanger.dart';
class features extends StatelessWidget {
  FlutterTts ftts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    ftts.speak('Choose one of the features below');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/feature.png"),
            fit: BoxFit.fill,
          ),
        ),
            child:ListView(
              padding: EdgeInsets.fromLTRB(0,40, 0, 0),
              children:[
                ListTile(
                 contentPadding: EdgeInsets.fromLTRB(300,0,0,150),
                  leading: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => arabic()
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
            ftts.setLanguage("English");
            ftts.setSpeechRate(0.5);
            ftts.setVolume(1.0);
            ftts.setPitch(1.0);
            SocketManager().send('8' , "English");
          },
          onPressed: () async {
            //your custom configuration
            await ftts.setLanguage("English");
            await ftts.setSpeechRate(0.5);

            await ftts.setVolume(1.0);

            await ftts.setPitch(1.0);
            ftts.speak("Object Detection");
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(155,70),
              backgroundColor: Colors.lightBlue,
              textStyle:
              const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

          ),
          child :const Text( 'Object Detection',style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9,1),
                      child: TextButton(
                        onLongPress: (){
                          ftts.setLanguage("English");
                          ftts.setSpeechRate(0.5);
                          ftts.setVolume(1.0);
                          ftts.setPitch(1.0);
                          SocketManager().send('10' , "English");
                        },
                        onPressed: () async {
                          //your custom configuration
                          await ftts.setLanguage("English");
                          await ftts.setSpeechRate(0.5);

                          await ftts.setVolume(1.0);

                          await ftts.setPitch(1.0);
                          ftts.speak("Reading Text");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(155,70),
                            backgroundColor: Colors.lightBlue,
                            textStyle:
                            const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                        ),
                        child :const Text( 'Reading Text',style: TextStyle(color: Colors.white)),
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
                              ftts.setLanguage("English");
                              ftts.setSpeechRate(0.5);
                              ftts.setVolume(1.0);
                              ftts.setPitch(1.0);
                              SocketManager().send('2' , "English");
                            },
                            onPressed: () async {
                              //your custom configuration
                              await ftts.setLanguage("English");
                              await ftts.setSpeechRate(0.5);

                              await ftts.setVolume(1.0);

                              await ftts.setPitch(1.0);
                              ftts.speak("Face Recognition");
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(155,70),
                                backgroundColor: Colors.lightBlue,
                                textStyle:
                                const TextStyle(fontSize: 15, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                            ),
                            child :const Text( 'Face Recognition',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(-0.9,1),
                          child: TextButton(
                            onLongPress: (){
                              ftts.setLanguage("English");
                              ftts.setSpeechRate(0.5);
                              ftts.setVolume(1.0);
                              ftts.setPitch(1.0);
                              SocketManager().send('6' , "English");
                            },
                            onPressed: () async {
                              //your custom configuration
                              await ftts.setLanguage("English");
                              await ftts.setSpeechRate(0.5);
                              await ftts.setVolume(1.0);
                              await ftts.setPitch(1.0);
                              ftts.speak("Cash Recognition");
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(155,70),
                                backgroundColor: Colors.lightBlue,
                                textStyle:
                                const TextStyle(fontSize: 15, fontFamily: 'Poppins',fontWeight: FontWeight.w700)
                            ),
                            child :const Text( 'Cash Recognition',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(13,80, 0,30),
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
                              ftts.setLanguage("English");
                              ftts.setSpeechRate(0.5);
                              ftts.setVolume(1.0);
                              ftts.setPitch(1.0);
                              SocketManager().send('4' , "English");
                            },
                            onPressed: () async {
                              //your custom configuration
                              await ftts.setLanguage("English");
                              await ftts.setSpeechRate(0.5);

                              await ftts.setVolume(1.0);

                              await ftts.setPitch(1.0);
                              ftts.speak("Describe Scene");
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(155,70),
                                backgroundColor: Colors.lightBlue,
                                textStyle:
                                const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                            ),
                            child :const Text( 'Describe Scene',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(-0.9,1),
                          child: TextButton(
                            onLongPress: (){
                              ftts.setLanguage("English");
                              ftts.setSpeechRate(0.5);
                              ftts.setVolume(1.0);
                              ftts.setPitch(1.0);
                              SocketManager().send('12' , "English");
                            },
                            onPressed: () async {
                              //your custom configuration
                              await ftts.setLanguage("English");
                              await ftts.setSpeechRate(0.5);

                              await ftts.setVolume(1.0);

                              await ftts.setPitch(1.0);
                              ftts.speak("Food Recognition");
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(155,70),
                                backgroundColor: Colors.lightBlue,
                                textStyle:
                                const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w700)

                            ),
                            child :const Text( 'Food Recognition',style: TextStyle(color: Colors.white)),
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