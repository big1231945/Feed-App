// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors

import 'package:feed_app/database/database_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'menu.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//Explicit

  final userformkey = GlobalKey<FormState>();
  late String usernameString, passwordString;
  final dbhelper = DatabaseHelper.instance;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;

//Method

  // signIn() {
  //   _auth
  //       .signInWithEmailAndPassword(
  //           email: 'thanakorn.deceloper@gmail.com', password: '123456')
  //       .then((user) {
  //     print('siged in $user');
  //   }).catchError((error) {
  //     print('error');
  //   });
  // }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : usernameString,
      DatabaseHelper.columnAge  : passwordString
    };
    final rowsAffected = await dbhelper.update(row);
    print('updated $rowsAffected row(s)');
  }


  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbhelper.queryRowCount();
    final rowsDeleted = await dbhelper.delete(id!);
    print('deleted $rowsDeleted row(s): row $id');
  }
   void _view() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbhelper.queryRowCount();
    final rowsDeleted = await dbhelper.queryAllRows();
    print('deleted $rowsDeleted row(s): row $id');
  }

  void _query() async {
    final allRows = await dbhelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : usernameString,
      DatabaseHelper.columnAge  : passwordString
    };
    final id = await dbhelper.insert(row);
    print('inserted row id: $id');
  }


  Future<void> readData() async {
    print('Work!!!');

    await db
        .child('/user/username/$usernameString')
        .once()
        .then((DataSnapshot snapshot) {
      mapdata = snapshot.value;
    }).onError((error, stackTrace) => null);

    // print(mapdata!);

    if (passwordString == mapdata) {
      // print('bin Gooooooooooooooo');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => menu());
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

          // _update();
          // _query();
        }
      },
    );
  }

  Future<void> loginThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: usernameString, password: passwordString)
        .then((respones) {
      print('Login OK =$usernameString');
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title=$title, message=$message');
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
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
          ],
        ),
      ),
    );
  }
}
