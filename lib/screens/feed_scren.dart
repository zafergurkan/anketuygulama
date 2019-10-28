import 'package:anketuygulama/services/auth_service.dart';
import 'package:flutter/material.dart';

class FeedScren extends StatefulWidget {
  static final String id = 'feed_screen';
  @override
  _FeedScrenState createState() => _FeedScrenState();
}

class _FeedScrenState extends State<FeedScren> {
    
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

        backgroundColor: Colors.white,
       
    
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(),
          child: Text("Logout"),
        ),
      ),
     
    );
  }

}