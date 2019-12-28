import 'package:anketuygulama/models/user_data.dart';
import 'package:anketuygulama/screens/activity_screen.dart';
import 'package:anketuygulama/screens/create_post_screen.dart';
import 'package:anketuygulama/screens/feed_scren.dart';
import 'package:anketuygulama/screens/profile_screen.dart';
import 'package:anketuygulama/screens/search_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            FeedScren(currentUserId: currentUserId,),
            SearchScreen(),
            CreateScreen(),
            ActivitySearch(),
            ProfileScreen(currentUserId: currentUserId, userId: currentUserId),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentTab = index;
            });
          },
        ),
        bottomNavigationBar: 
        CupertinoTabBar(
          backgroundColor: Colors.deepPurple,
          activeColor: Colors.white,
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
            
              title:Text('Anasayfa'),
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
      
               title:Text('Ara'),
              icon: Icon(
              
                Icons.search,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              title:Text('Kamera'),
              icon: Icon(
                Icons.photo_camera,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              title:Text('Bildirim'),
              icon: Icon(
                Icons.notifications,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              title:Text('Profi'),
              icon: Icon(
                Icons.account_circle,
                size: 32.0,
              ),
            ),
          ],
        ));
  }
}
