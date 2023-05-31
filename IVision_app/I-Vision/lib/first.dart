import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'firstA.dart';
import 'features.dart';


class first extends StatelessWidget {
  FlutterTts ftts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    ftts.setLanguage('en_US');
    ftts.speak('Start using the app.............'
        'Move to the next page by pressing the bottom of the screen twice in a row');
    return Scaffold(
      body :Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              children: [
                 Container(
                   width: 394.4,
                   height: 500.3,
                   decoration: const BoxDecoration(
                     color: Colors.white,
                   ),
                   child:Image.asset(
                     'assest/images/welcome.jpg',
                     width: 100,
                     height: 100,
                     fit: BoxFit.cover,
                   ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => firstA()
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Padding(padding: const EdgeInsets.only(top:10 ),
            child: Text(
                'Blind Assistance System',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold)
            ),),


            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, -1),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:0 ),
                        child:Align(
                        alignment: const AlignmentDirectional(0,0),
                        child: GestureDetector(
                          onDoubleTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => features()),
                            );
                          },

                          child: ElevatedButton(
                            onPressed: () async {

                              //your custom configuration
                              await ftts.setLanguage("en-US");
                              await ftts.setSpeechRate(0.5); //speed of speech
                              await ftts.setVolume(1.0); //volume of speech
                              await ftts.setPitch(1);
                              //play text to sp
                              ftts.speak("Get started");
                            },
                            child :const Text('GET STARTED',style: TextStyle(color: Colors.blue)),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300,170),
                              backgroundColor: Colors.white,
                              textStyle:
                              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

                            ),
                          ),
                        ),

                      ),
              ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}