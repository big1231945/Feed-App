// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors

import 'dart:io';

import 'package:feed_app/database/database_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';

import '../stroage.dart';
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
  final dbhelper = DatabaseHelper.instance;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
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

    if (passwordString == mapdata) {
      // print('bin Gooooooooooooooo');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => menu(storage: ameStorage(),));
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
      icon: Icon(Icons.login),
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
          _incrementUsername();
          // _update();
          // _query();
        }
      },
      tooltip: 'ล็อกอิน',
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
        helperText: 'กรอกชื่อผู้ใช้ของคุณ',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (var value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกผู้ใช้งาน';
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
        helperText: 'กรอกรหัสผ่านของคุณ',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (var val) {
        if (val!.length < 6) {
          return 'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร';
        } else {
          return null;
        }
      },
      onSaved: (var val) {
        passwordString = val!.trim();
      },
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
        title: Text('Sign In', style: TextStyle(color: Colors.tealAccent)),
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
      body: Form(
        key: userformkey,
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: [
            showAppLogo(),
            userNameText(),
            passwordText(),
            Text('data $_usernameSeve')
          ],
        ),
      ),
    );
  }
}
