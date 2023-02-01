import 'package:flutter/material.dart';
import 'package:phoneapp/phone_call_main.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneCallMainPage(),
    );
  }
}

//                      Dikkat!!!
///bu ödev üzerinden birazz tekrar yapılıcaktır bu sayfaları incelemek isteyen bi baksın
