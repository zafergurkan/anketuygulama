import 'dart:io';

import 'package:anketuygulama/models/user_model.dart';
import 'package:anketuygulama/services/database_service.dart';
import 'package:anketuygulama/services/storage_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  EditProfileScreen({this.user});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File _profileImage;
  String _name = '';
  String _bio = '';
  bool _isLoading  = false;
  @override
  void initState(){
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }
  _handleImageFromGallery() async{
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(imageFile!=null){
      setState(() {
       _profileImage =imageFile; 
      });
    }

  }
  _displayProfileImage(){
    //no new profile image
    if(_profileImage==null){
      if(widget.user.profileImageUrl.isEmpty){
        return AssetImage('assets/images/user_placeholder.jpg');
      }
      else{
        return CachedNetworkImageProvider(widget.user.profileImageUrl);
      }
    }else{
      return FileImage(_profileImage);
    }
  }
  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
       _isLoading=true; 
      });
      //update databsae
      String _profileImageUrl = '';

      if(_profileImage==null){
        _profileImageUrl = widget.user.profileImageUrl;
      }else {
        _profileImageUrl = await StorageService.uploadProfileImage(widget.user.profileImageUrl, _profileImage);
      }
      User user = User(
          id: widget.user.id,
          name: _name,
          profileImageUrl: _profileImageUrl,
          bio: _bio);
      //databese update
      DatabaseService.updateUser(user);
          Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profili Düzenle',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
          child: ListView(
          children :<Widget>[
            _isLoading ? LinearProgressIndicator(backgroundColor: Colors.deepPurple[200],
            valueColor: AlwaysStoppedAnimation(Colors.deepPurple),)
            :SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.grey,
                      backgroundImage: _displayProfileImage(),
                    ),
                    FlatButton(
                      onPressed: _handleImageFromGallery,
                      child: Text(
                        'Profil Resmini Değiştir',
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 16.0),
                      ),
                    ),
                    TextFormField(
                      initialValue: _name,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'İsim',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Lütfen doğru bir isim giriniz!'
                          : null,
                      onSaved: (input) => _name = input,
                    ),
                    TextFormField(
                      initialValue: _bio,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.book,
                          size: 30.0,
                        ),
                        labelText: 'Hakkında',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Lütfen daha kısa bir hakkında yazısı giriniz!'
                          : null,
                      onSaved: (input) => _bio = input,
                    ),
                    Container(
                      margin: EdgeInsets.all(40.0),
                      height: 40.0,
                      width: 250.0,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        child: Text(
                          'Kaydet',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
