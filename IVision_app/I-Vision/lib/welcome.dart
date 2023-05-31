import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vision/first.dart';
import 'package:vision/firstA.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {

  FlutterTts ftts = FlutterTts();
  late SharedPreferences _prefs;
  bool _showScreen = true;
  bool _showarabicPage = false;
  bool _showenglishPage = false;
  void _checkIfShowScreen() async {
    _prefs = await SharedPreferences.getInstance();
    _showScreen = _prefs.getBool('showScreen') ?? true;

    if (_showScreen) {
      _prefs.setBool('showScreen', false);
    }
  }

  void _checkSelectedPage() async {
    _prefs = await SharedPreferences.getInstance();
    int selectedPage = _prefs.getInt('selectedPage') ?? 0;

    if (selectedPage == 1) {
      setState(() {
        _showarabicPage = true;
      });
    } else if (selectedPage == 2) {
      setState(() {
        _showenglishPage = true;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _checkIfShowScreen();
    _checkSelectedPage();
  }



  void _storeSelectedPage(int selectedPage) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('selectedPage', selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return _showScreen ? Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/first.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0,5),
                child: TextButton(
                  onPressed: () async {
                    await ftts.setLanguage("en-US");
                    await ftts.setSpeechRate(0.5);

                    await ftts.setVolume(1.0);

                    await ftts.setPitch(1.0);

                    ftts.speak("Choose The Application Language");

                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(270,10),
                      backgroundColor: Colors.white,
                      textStyle:
                      const TextStyle(fontSize: 13, fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
                  child :const Text('',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0,1),
                child: TextButton(
                  onPressed: () async {
                    await ftts.setLanguage("en-US");
                    await ftts.setSpeechRate(0.5);

                    await ftts.setVolume(1.0);

                    await ftts.setPitch(1.0);

                    ftts.speak("Choose The Application Language");
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(270,10),
                      backgroundColor: Colors.lightBlue,
                      textStyle:
                      const TextStyle(fontSize: 13, fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
                  child :const Text('Choose The Application Language',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0,-0.7),
                child: TextButton(
                  onPressed: () async {
                    //your custom configuration
                    await ftts.setLanguage("Arabic");
                    await ftts.setSpeechRate(0.5);

                    await ftts.setVolume(1.0);

                    await ftts.setPitch(1.0);
                    ftts.speak("اختر لغة التطبيق");
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(270,40),
                      backgroundColor: Colors.lightBlue,
                      textStyle:
                      const TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.w600)

                  ),
                  child :const Text( ' اختر لغة التطبيق ',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0,-0.5),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => firstA()));
                    setState(() {
                      _showarabicPage = true;
                      _showenglishPage = false;
                    });
                    _storeSelectedPage(1);


                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      //your custom configuration
                      await ftts.setLanguage("Arabic");
                      await ftts.setSpeechRate(0.5);

                      await ftts.setVolume(1.0);

                      await ftts.setPitch(1.0);
                      ftts.speak("اللغة العربية");

                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(130,55),
                        backgroundColor: Colors.white,
                        textStyle:
                        const TextStyle(fontSize: 17, fontFamily: 'Poppins',fontWeight: FontWeight.bold)

                    ),
                    child :const Text('العربية',style: TextStyle(color: Colors.lightBlue)),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0,-1.5),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => first()));
                    setState(() {
                      _showarabicPage = false;
                      _showenglishPage = true;
                    });
                    _storeSelectedPage(2);
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      await ftts.setLanguage("English");
                      await ftts.setSpeechRate(0.5);

                      await ftts.setVolume(1.0);

                      await ftts.setPitch(1.0);
                      ftts.speak("English");

                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(130,55),
                        backgroundColor: Colors.white,
                        textStyle:
                        const TextStyle(fontSize: 17, fontFamily: 'Poppins',fontWeight: FontWeight.bold)

                    ),
                    child :const Text('English',style: TextStyle(color: Colors.lightBlue)),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _showarabicPage,
              child: firstA(),
            ),
            Visibility(
              visible: _showenglishPage,
              child: first(),
            ),
          ],

        ),

      ),
    ) : _showarabicPage
        ? firstA()
        : _showenglishPage
        ? first()
        :Container();



  }
}



