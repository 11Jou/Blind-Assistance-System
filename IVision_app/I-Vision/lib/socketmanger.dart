import 'dart:io';
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
class SocketManager {
  static final SocketManager _singleton = SocketManager._internal();
  late Socket _socket;
  FlutterTts ftts = FlutterTts();

  factory SocketManager() {
    return _singleton;
  }
  SocketManager._internal() {
    connect();
  }
  void connect() async {
    _socket = await Socket.connect("192.168.1.4", 8080);
  }
  void send(String message, String lang){
    if (_socket != null) {

      _socket.write(message);
      _socket.listen((data) {
        var output = utf8.decode(data);
        var final_output = jsonDecode(output);
        var encode = jsonEncode(final_output);
        print(encode);
        ftts.speak(encode);
      });
    }
  }
}