import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'first.dart';
import 'arabic.dart';

class firstA extends StatelessWidget {

  FlutterTts ftts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    void initTts() {
      ftts.setLanguage('ar_SA');
    }
    ftts.speak('ابدأ استخدام التطبيق.............'
        'الانتقال للصفحة التالية عن طريق الضغط أسفل الشاشة مرتين متتاليتين');
    return Scaffold(
      body :Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                            builder: (BuildContext context) => first()
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(top:10 ),
              child: Text(
                  'نظام مساعدة المكفوفين',
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
                                MaterialPageRoute(builder: (context) => arabic()),
                              );
                            },

                            child: ElevatedButton(
                              onPressed: () async {

                                //your custom configuration
                                await ftts.setLanguage("ar_SA");
                                await ftts.setSpeechRate(0.5); //speed of speech
                                await ftts.setVolume(1.0); //volume of speech
                                await ftts.setPitch(1);
                                //play text to sp
                                ftts.speak("ابدأ");
                              },
                              child :const Text('ابدأ',style: TextStyle(color: Colors.blue)),
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