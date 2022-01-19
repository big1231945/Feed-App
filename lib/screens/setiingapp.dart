// import 'package:feed_app/screens/home.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class SetiingApp extends StatefulWidget {
//   @override
//   _SetiingAppState createState() => _SetiingAppState();
// }

// // Var

// final DatabaseReference db = FirebaseDatabase(
//         databaseURL:
//             'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
//     .reference();

// // Method

// class _SetiingAppState extends State<SetiingApp> {
// //Explicit
//   final userformkey = GlobalKey<FormState>();
//   var mapdata;
//   String usernameString, passwordString;

//   Future<void> readData() async {
//     print('Work!!!');

//     await db
//         .child('/user/username/$usernameString')
//         .once()
//         .then((DataSnapshot snapshot) {
//       mapdata = snapshot.value;
//     }).onError((error, stackTrace) => null);

//     print(mapdata);

//     if (passwordString == mapdata) {
//       print('bin Gooooooooooooooo');
//       MaterialPageRoute materialPageRoute =
//           MaterialPageRoute(builder: (BuildContext context) => home());
//       Navigator.of(context).push(materialPageRoute);
//     }
//   }

// //Method
//   Widget showAppLogo1() {
//     return Container(
//       width: 120.0,
//       height: 120.0,
//       child: Image.asset('images/icon.png'),
//     );
//   }

//   Widget showAppName() {
//     return Text(
//       'Feed App',
//       style: TextStyle(
//           fontSize: 30.0,
//           color: Colors.orange.shade600,
//           fontFamily: 'OpenSans',
//           fontWeight: FontWeight.bold),
//     );
//   }

//   Widget signInButton() {
//     return IconButton(
//       icon: Icon(Icons.login),
//       onPressed: () {
//         print('you cilck login');

//         // createData();
//         if (userformkey.currentState.validate()) {
//           userformkey.currentState.save();
//           readData();
//           print('user = $usernameString, password= $passwordString');
//           //   // logindsf();
//           //   // getFirebaseData();

//         }
//       },
//     );
//   }

//   // Future<Null> logindsf() async {
//   //   await Firebase.initializeApp().then((value) async {
//   //     print('###firebase Initalize Success ###');
//   //     await FirebaseAuth.instance
//   //         .createUserWithEmailAndPassword(
//   //             email: usernameString, password: passwordString)
//   //         .then((value) => print('Success'))
//   //         .catchError(
//   //             (onError) => bigDialog(context, onError.code, onError.message));
//   //   });
//   // }
//   //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   //   await firebaseAuth
//   //       .createUserWithEmailAndPassword(
//   //           email: usernameString, password: passwordString)
//   //       .then((respones) {
//   //     print('Login OK =$usernameString');
//   //   }).catchError((response) {
//   //     String title = response.code;
//   //     String message = response.message;
//   //     print('title=$title, message=$message');
//   //   });
//   // }

//   Widget userNameText() {
//     return TextFormField(
//       style: TextStyle(color: Colors.green),
//       decoration: InputDecoration(
//         icon: Icon(
//           Icons.person,
//           size: 35.0,
//           color: Colors.yellow.shade600,
//         ),
//         labelText: 'User',
//         helperText: 'กรอกชื่อผู้ใช้ของคุณ',
//         helperStyle: TextStyle(fontStyle: FontStyle.italic),
//       ),
//       validator: (String value) {
//         // if (!((value.contains('@')) && (value.contains('.')))) {
//         if (value.isEmpty) {
//           return 'กรุณากรอกUser';

//           // } else {
//           //   return null;
//         }
//       },
//       onSaved: (String val) {
//         usernameString = val.trim();
//       },
//     );
//   }

//   Widget passwordText() {
//     return TextFormField(
//       style: TextStyle(color: Colors.green),
//       decoration: InputDecoration(
//         icon: Icon(
//           Icons.lock,
//           size: 35.0,
//           color: Colors.blue.shade600,
//         ),
//         labelText: 'Password',
//         helperText: 'กรอกรหัสผ่านของคุณ',
//         helperStyle: TextStyle(fontStyle: FontStyle.italic),
//       ),
//       validator: (String val) {
//         if (val.length < 6) {
//           return 'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร';
//         } else {
//           return null;
//         }
//       },
//       onSaved: (String val) {
//         passwordString = val.trim();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//         actions: [signInButton()],
//         backgroundColor: Colors.cyan,
//       ),
// //       appBar: GradientAppBar(
// //   title: Text('Flutter Gradient Example'),
// //   gradient: LinearGradient(
// //     colors: [
// //       Colors.cyan,
// //       Colors.indigo,
// //     ],
// //   ),
// // ),
//       body: Form(
//         key: userformkey,
//         child: ListView(
//           padding: EdgeInsets.all(50.0),
//           children: [
//             showAppLogo1(),
//             userNameText(),
//             passwordText(),
//           ],
//         ),
//       ),
//     );
//   }
// }
