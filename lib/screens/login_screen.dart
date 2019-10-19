import 'package:flutter/material.dart';
import 'package:anketuygulama/screens/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  static final String id = 'login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  _sumbit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
      //login firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView (
                child: Container( height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'PollApp',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: ' SEGA',
                    color: Color.fromRGBO(0, 191, 255, 50)),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        validator: (input) => !input.contains('@')
                            ? 'lütfen Geçerli Bir E-Mail Adresi Giriniz.'
                            : null,
                        onSaved: (input) => _password = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) =>
                            input.length < 8 ? 'en az 8 karakter olmalı..' : null,
                        onSaved: (input) => _email = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 200.0,
                      child: FlatButton(
                        onPressed: _sumbit,
                        color: Color.fromRGBO(0, 191, 255, 50),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 200.0,
                      child: FlatButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SinupScreen.id),
                        color: Color.fromRGBO(0, 191, 255, 50),
                        child: Text(
                          "Singup",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
