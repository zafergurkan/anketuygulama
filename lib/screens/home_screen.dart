import 'package:anketuygulama/screens/activity_screen.dart';
import 'package:anketuygulama/screens/creat_post_screen.dart';
import 'package:anketuygulama/screens/feed_scren.dart';
import 'package:anketuygulama/screens/profile_screen.dart';
import 'package:anketuygulama/screens/searc_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String userId;
  HomeScreen({this.userId}); 

  static final String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

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
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            FeedScren(),
            SearchScreen(),
            CreateScreen(),
            ActivitySearch(),
            ProfileScreen(userId: widget.userId),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentTab = index;
            });

          },
        ),
        bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.deepPurple,
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
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
