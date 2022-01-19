// import 'package:feed_app/screens/home.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';


// class getFirebaseData {
// // Var

//   final DatabaseReference db = FirebaseDatabase(
//         databaseURL:
//             'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
//     .reference();

// var mapdata  ;
// late String usernameString, passwordString;
// // Method

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
//       // Navigator.of(context).push(materialPageRoute);
//     }
//   }

// }
