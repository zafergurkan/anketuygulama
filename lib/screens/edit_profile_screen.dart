import 'package:anketuygulama/models/user_model.dart';
import 'package:anketuygulama/services/database_service.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  EditProfileScreen({this.user});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';
  @override
  void initState(){
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //update databsae
      String _profileImageUrl = '';
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg'),
                  ),
                  FlatButton(
                    onPressed: () => print('Profil Resmini Değiştir'),
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
        ),
      ),
    );
  }
}
