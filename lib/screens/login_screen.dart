import 'package:anketuygulama/services/auth_service.dart';
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
    AuthService.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'PollApp',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'SEGA',
                    color: Color.fromRGBO(0, 191, 255, 50)),
              ),
              SizedBox(
                height: 40.0,
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
                        decoration: InputDecoration(
                            labelText: 'E-Mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        validator: (input) => !input.contains('@')
                            ? 'lütfen Geçerli Bir E-Mail Adresi Giriniz.'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        validator: (input) => input.length < 8
                            ? 'en az 8 karakter olmalı..'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 27.0,
                    ),
                    Container(
                      width: 200.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        onPressed: _sumbit,
                        color: Color.fromRGBO(0, 191, 255, 50),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SinupScreen.id),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 18.0),
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
