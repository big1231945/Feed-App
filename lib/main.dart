// @dart=2.9
// import 'package:feed_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:feed_app/router.dart';

String iniRoute = '/home';
// final dbhelper = DatabaseHelper.instance;

main() {
  runApp(MyApp());
}
// main() {
//   if (dbhelper.database==1) {
//     runApp(MyApp());

//   } else
//     () {
//       iniRoute = '/menu';
//       runApp(MyApp());
//     };
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: iniRoute,
    );
  }
}
