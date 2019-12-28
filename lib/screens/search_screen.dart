import 'package:anketuygulama/models/user_data.dart';
import 'package:anketuygulama/models/user_model.dart';
import 'package:anketuygulama/screens/profile_screen.dart';
import 'package:anketuygulama/services/database_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _users;

  _buildUserTile(User user) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: user.profileImageUrl.isEmpty
              ? AssetImage('assets/images/user_placeholder.jpg')
              : CachedNetworkImageProvider(user.profileImageUrl),
        ),
        title: Text(user.name),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  currentUserId:Provider.of<UserData>(context).currentUserId,
                      userId: user.id,
                    ))));
  }

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              border: InputBorder.none,
              hintText: 'Ara',
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: _clearSearch,
              ),
              filled: true,
            ),
            onSubmitted: (input) {
              if (input.isNotEmpty && input.trim().isNotEmpty) {
                setState(() {
                  _users = DatabaseService.searchUsers(input);
                });
              }
            },
          ),
        ),
        body: _users == null
            ? Center(
                child: Text('Arama Yapın!',
                style: TextStyle(color: Colors.deepPurple),
                ),
              )
            : FutureBuilder(
                future: _users,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data.documents.length == 0) {
                    return Center(
                      child: Text('Böyle bir kullanıcı yok!',
                       style: TextStyle(color: Colors.deepPurple),),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = User.fromDoc(snapshot.data.documents[index]);
                      return _buildUserTile(user);
                    },
                  );
                },
              ));
  }
}
