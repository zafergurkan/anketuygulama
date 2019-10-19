import 'package:anketuygulama/screens/login_screen.dart';
import 'package:anketuygulama/screens/signup_screen.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PollApp',
      debugShowCheckedModeBanner: false,
      
       home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SinupScreen.id: (context) => SinupScreen(),
        }

    );
  }
}

