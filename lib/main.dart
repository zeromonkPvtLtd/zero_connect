import 'package:flutter/material.dart';
import 'login_registration/email_check_screen.dart';
import 'splash_screen.dart';
import '/login_registration/email_check_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => Splash(),
        EmailCheckScreen.id: (context) => EmailCheckScreen()
      },
    );
  }
}
