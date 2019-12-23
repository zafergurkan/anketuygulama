import 'package:anketuygulama/models/post_model.dart';
import 'package:anketuygulama/models/user_model.dart';

import 'package:anketuygulama/services/database_service.dart';
import 'package:anketuygulama/widget/post_view.dart';

import 'package:flutter/material.dart';

class FeedScren extends StatefulWidget {
  static final String id = 'feed_screen';

  final String currentUserId;

  FeedScren({this.currentUserId});

  @override
  _FeedScrenState createState() => _FeedScrenState();
}

class _FeedScrenState extends State<FeedScren> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _setupFeed();
  }

  _setupFeed() async {
    List<Post> posts = await DatabaseService.getFeedPosts(widget.currentUserId);
    setState(() {
      _posts = posts;
    });
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
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => _setupFeed(),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int index) {
            Post post = _posts[index];
            return FutureBuilder(
              future: DatabaseService.getUserWithId(post.authorId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                User author = snapshot.data;
                return PostView(currentUserId: widget.currentUserId,
                post: post,
                author: author,);
              },
            );
          },
        ),
      ),
    );
  }
}
