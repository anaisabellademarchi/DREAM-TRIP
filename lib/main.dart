import 'package:flutter/material.dart';
import 'telas_de_login/tela_de_login.dart';

void main() {
  runApp(const DreamTrip());
}

///

class DreamTrip extends StatelessWidget {
  const DreamTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "DreamTrip",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: const Color.fromARGB(255, 18, 162, 224)),
        home: const Login());
  }
}
