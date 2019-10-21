import 'package:anketuygulama/services/auth_service.dart';
import 'package:flutter/material.dart';

class FeedScren extends StatefulWidget {
  static final String id = 'feed_screen';
  @override
  _FeedScrenState createState() => _FeedScrenState();
}

class _FeedScrenState extends State<FeedScren> {
  int _cIndex = 0;
  static const _kFontFam = 'MyFlutterApp';
  static const IconData cc_nc_eu =
      const IconData(0xe800, fontFamily: _kFontFam);
  static const IconData star = const IconData(0xe801, fontFamily: _kFontFam);
  static const IconData pencil = const IconData(0xe802, fontFamily: _kFontFam);
  static const IconData star_empty =
      const IconData(0xe810, fontFamily: _kFontFam);
  static const IconData home = const IconData(0xe811, fontFamily: _kFontFam);
  static const IconData mail = const IconData(0xe815, fontFamily: _kFontFam);
  static const IconData heart = const IconData(0xe816, fontFamily: _kFontFam);
  static const IconData heart_broken =
      const IconData(0xf028, fontFamily: _kFontFam);
  static const IconData reply = const IconData(0xf02a, fontFamily: _kFontFam);
  static const IconData chat = const IconData(0xf03d, fontFamily: _kFontFam);
  static const IconData bell = const IconData(0xf03f, fontFamily: _kFontFam);
  static const IconData user = const IconData(0xf061, fontFamily: _kFontFam);
  static const IconData export_icon =
      const IconData(0xf081, fontFamily: _kFontFam);
  static const IconData comment = const IconData(0xf4ac, fontFamily: _kFontFam);
  static const IconData camera = const IconData(0xf4f7, fontFamily: _kFontFam);
  static const IconData search = const IconData(0xf50d, fontFamily: _kFontFam);
  static const IconData lock_alt =
      const IconData(0xf510, fontFamily: _kFontFam);
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
      switch (index) {
        case 0:
          //feedScreen
          print(index);
          break;
        case 1:
          //exploreScreen
          print(index);
          break;
          case 2:
          //notificationScreen
          print(index);
          break;
          case 3:
          print(index);
          break;

        default:
      }
    });
  }
  void _selectAppBar(int i){
    switch (i) {
      case 0:
        print(i);
        break;
        case 1:
        print(i);
        break;
      default:
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('PollApp',style: TextStyle(fontSize: 25.00,color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(camera,color: Colors.black),
            onPressed: (){
              _selectAppBar(0);
            },
          ),
          IconButton(
            icon: Icon(chat,color: Colors.black),
            onPressed: (){
              _selectAppBar(1);
            }
          )
        ],
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(),
          child: Text("Logout"),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(home, color: Colors.black),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(search, color: Colors.black),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.black),
            title: Text(''),
          ),
          BottomNavigationBarItem(
              icon: Icon(user, color: Colors.black), title: Text('')),
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
    );
  }
}
