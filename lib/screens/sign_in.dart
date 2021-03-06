// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors

import 'dart:io';


import 'package:feed_app/utility/data_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';

class UserNameStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/UserName2.txt');
  }

  Future<String> readUeserName() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return 'nooo';
    }
  }

  Future<File> writeUeserName(String usernameSeve) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(usernameSeve);
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.storage}) : super(key: key);
  final UserNameStorage storage;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//Explicit

  String _usernameSeve = '';

  final userformkey = GlobalKey<FormState>();
  var usernameString, passwordString;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp2-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;

//Method
  Future<void> readData() async {
    print('Work!!!');

    await db
        .child('/user/username/$usernameString')
        .once()
        .then((DataSnapshot snapshot) {
      mapdata = snapshot.value;
    }).onError((error, stackTrace) => null);

    // print('tttttttt   $mapdata');

    if (passwordString.toString() == mapdata.toString()) {
      // print('bin Gooooooooooooooo');
      _incrementUsername();
      incrementUsernameData(usernameString);
      MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => menu(
                storage: UserNameStorage(),
              ));
      Navigator.of(context).push(materialPageRoute);
    }
  }

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

  Widget signInButton() {
    return IconButton(
      icon: Icon(
        Icons.login,
        color: Colors.green,
      ),
      onPressed: () {
        // _query();
        // MaterialPageRoute materialPageRoute =
        //     MaterialPageRoute(builder: (BuildContext context) => menu());
        // Navigator.of(context).push(materialPageRoute);
        // // signIn();
        print('you cilck login');
        if (userformkey.currentState!.validate()) {
          userformkey.currentState!.save();
          print('user = $usernameString, password= $passwordString');
          readData();

          // _update();
          // _query();
        }
      },
      tooltip: '?????????????????????',
    );
  }

  // Future<void> loginThread() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth
  //       .createUserWithEmailAndPassword(
  //           email: usernameString, password: passwordString)
  //       .then((respones) {
  //     print('Login OK =$usernameString');
  //   }).catchError((response) {
  //     String title = response.code;
  //     String message = response.message;
  //     print('title=$title, message=$message');
  //   });
  // }

  Widget userNameText() {
    return TextFormField(
      style: TextStyle(color: Colors.green),
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          size: 35.0,
          color: Colors.yellow.shade600,
        ),
        labelText: 'User',
        helperText: '????????????????????????????????????????????????????????????',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (var value) {
        if (value!.isEmpty) {
          return '??????????????????????????????????????????????????????';
        } else {
          return null;
        }
      },
      onSaved: (var val) {
        usernameString = val!.trim();
        _usernameSeve = val.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.green),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 35.0,
          color: Colors.blue.shade600,
        ),
        labelText: 'Password',
        helperText: '??????????????????????????????????????????????????????',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (var val) {
        if (val!.length < 6) {
          return '?????????????????????????????????????????????????????????????????????????????? 6 ????????????????????????';
        } else {
          return null;
        }
      },
      onSaved: (var val) {
        passwordString = val!.trim();
      },
    );
  }

  Widget button4() {
    return RaisedButton(
      color: Colors.green,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        if (userformkey.currentState!.validate()) {
          userformkey.currentState!.save();
          print('user = $usernameString, password= $passwordString');
          readData();

          // _update();
          // _query();
        }
      },
    );
  }

  Widget text00() {
    return Text(
      "         ",
      style: TextStyle(height: 3),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readUeserName().then((String value) {
      setState(() {
        _usernameSeve = value;
      });
    });
  }

  Future<File> _incrementUsername() {
    setState(() {
      _usernameSeve;
    });
    // Write the variable as a string to the file.
    return widget.storage.writeUeserName(_usernameSeve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In', style: TextStyle(color: Colors.white)),
          actions: [signInButton()],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.cyan,
                  Colors.indigo,
                ],
              ),
            ),
          ),
          // backgroundColor: Colors.cyan,
        ),
//       appBar: GradientAppBar(
//   title: Text('Flutter Gradient Example'),
//   gradient: LinearGradient(
//     colors: [
//       Colors.cyan,
//       Colors.indigo,
//     ],
//   ),
// ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                Colors.lightBlue,
              ],
            )),
            child: Form(
              key: userformkey,
              child: ListView(
                padding: EdgeInsets.all(50.0),
                children: [
                  showAppLogo(),
                  userNameText(),
                  passwordText(),
                  text00(),
                  button4()
                ],
              ),
            ),
          ),
        ));
  }
}
