import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          
          backgroundColor: Colors.white,
          title: Text(
            'PollApp',
            style: TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'SEGA',
              fontSize: 15.0,
            ),
          ),
        ),
      body: Center(
        child: Text("Create Screenw"),
      ),
    );
  }
}