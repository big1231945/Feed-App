// @dart=2.9
// import 'package:feed_app/screens/sign_in.dart';
import 'dart:io';

import 'package:feed_app/screens/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:feed_app/router.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/menu.dart';

String iniRoute = '/home';
// final dbhelper = DatabaseHelper.instance;
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

  var _usernameSeve;
 
}

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
//  MyApp({Key key, this.storage}) : super(key: key);
//   final UserNameStorage storage;
//   final DatabaseReference db = FirebaseDatabase(
//           databaseURL:
//               'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
//       .reference();
//   var mapdata;
//   var mapda;
//   var _usernameSeve ;
//   remeber() {
//     var widget;
//     return widget.storage.readUeserName().then((String value) {
//       _usernameSeve = value;
//       db.child('/user/run/$_usernameSeve').once().then((DataSnapshot snapshot) {
//         mapda = snapshot.value;
//       }).onError((error, stackTrace) => null);
//       print(_usernameSeve);
//       // print(mapda);
//      print('goooooo $mapda');
//     });
//   }

//   Future<void> readData() async {
//     print('Work!!!');

//     await db.child('/user/nameTag/$_usernameSeve').once().then((DataSnapshot snapshot) {
//       mapdata = snapshot.value;
//     }).onError((error, stackTrace) => null);

//     print(mapdata);
//     if (_usernameSeve == mapdata) {
//       // print('bin Gooooooooooooooo');
//       MaterialApp(
//       home:menu()
//       );
//     }
    
//     MaterialApp(home: home(),);
//   }
   
  @override
  Widget build(BuildContext context) {
    // readData();
    // }
    return
    MaterialApp(
      
      routes: map,
      initialRoute: iniRoute,
      theme: _buildShrineTheme(),
    );
  }
}
ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: sandyBrown,
    primaryColor: yellowGreen,
    buttonColor: yellowGreen,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: yellowGreen,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: sandyBrown);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: sandyBrown,
        bodyColor: sandyBrown,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink400,
  primaryVariant: sandyBrown,
  secondary: keyLime,
  secondaryVariant: sandyBrown,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: sandyBrown,
  onSecondary: sandyBrown,
  onSurface: sandyBrown,
  onBackground: sandyBrown,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color keyLime = Color(0xFFFBC4AB);
const Color yellowGreen = Color(0xFFF8AD9D);
const Color shrinePink300 = Color(0xFFF4978E);
const Color shrinePink400 = Color(0xFFF08080);

const Color sandyBrown = Color(0xFFEE964B);
const Color yellowGreenCrayola = Color(0xFFB5E48C);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;