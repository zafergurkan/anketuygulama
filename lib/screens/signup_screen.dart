import 'package:anketuygulama/services/auth_service.dart';
import 'package:flutter/material.dart';

class SinupScreen extends StatefulWidget {
  static final String id = 'Signup Screen';

  @override
  _SinupScreenState createState() => _SinupScreenState();
}

class _SinupScreenState extends State<SinupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;
  _sumbit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 15.0,
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
                            labelText: 'Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        validator: (input) => input.trim().isEmpty
                            ? 'İsim Alanı Boş Geçilemez.'
                            : null,
                        onSaved: (input) => _name = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          labelText: 'E-Mail',
                        ),
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
                      height: 20.0,
                    ),
                    Container(
                      width: 200.0,
                      child: FlatButton(
                        onPressed: _sumbit,
                        color: Color.fromRGBO(0, 191, 255, 50),
                        child: Text(
                          "Singup",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 191, 255, 50),
                        child: Text(
                          "Login",
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
