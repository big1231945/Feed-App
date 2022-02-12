import 'dart:io';

import 'package:feed_app/screens/sign_in.dart';
import 'package:feed_app/stroage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  // Method

  Widget showAppLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/icon.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Feed App',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.orange.shade600,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold),
    );
  }

  Widget loginButton() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You click sign up');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => SignIn(storage: UserNameStorage()));
            Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget outApp() {
    return OutlineButton(child: Text('Exit'), onPressed: () {
      SystemNavigator.pop();
    });
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        loginButton(),
        SizedBox(
          width: 4.0,
        ),
        outApp()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyan,
              Colors.indigo,
                            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showAppLogo(),
              showAppName(),
              SizedBox(height: 8.0),
              showButton(),
            ],
          ),
        ),
      )),
    );
  }
}
