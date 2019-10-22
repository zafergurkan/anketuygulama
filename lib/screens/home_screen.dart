import 'package:anketuygulama/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: () => AuthService.logout(),
            child: Text("Logout"),
          ),
        ),
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
        bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.deepPurple,
          currentIndex: _currentTab,
          onTap: (int index){
            setState(() {
             _currentTab=index; 
             
            });

          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 32.0,
              ),
            ),
          ],
        ));
  }
}
