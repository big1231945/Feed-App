// @dart=2.9
// import 'package:feed_app/screens/sign_in.dart';

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/screens/home.dart';
import 'package:feed_app/screens/sign_in.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:feed_app/router.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/menu.dart';

String iniRoute = '/home';
// final dbhelper = DatabaseHelper.instance;
// class UserNameStorage {

//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();

//     return directory.path;
//   }

//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/UserName2.txt');
//   }

//   Future<String> readUeserName() async {
//     try {
//       final file = await _localFile;

//       // Read the file
//       final contents = await file.readAsString();

//       return contents;
//     } catch (e) {
//       // If encountering an error, return 0
//       return 'nooo';
//     }
//   }

//   Future<File> writeUeserName(String usernameSeve) async {
//     final file = await _localFile;

//     // Write the file
//     return file.writeAsString(usernameSeve);
//   }

//   var _usernameSeve;

// }

main() {
  WidgetsFlutterBinding.ensureInitialized();
  noti().notificationInt();
  UserNameStorage();
  runApp(MyApp());
}

class noti extends MyApp {
  BuildContext get context => null;

  void notificationInt() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/cat_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          defaultColor: Colors.teal,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          defaultColor: Colors.teal,
          // locked: true,
          importance: NotificationImportance.High,
          // soundSource: 'resource://raw/res_custom_notification',
        ),
      ],
    );
    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Notification Created on ${notification.channelKey}',
        ),
      ));
    });
    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel') {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => menu(
            storage: UserNameStorage(),
          ),
        ),
        (route) => route.isFirst,
      );
    });
  }
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key, this.storage}) : super(key: key);
  final UserNameStorage storage;

  Future<String> checkUserAndNavigate(BuildContext context) async {
    return loadUsernameData();
  }

  @override
  Widget build(BuildContext context) {
    checkUserAndNavigate(context).then((res) {
      if (res.isEmpty) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/menu');
      }
    });

    return new Scaffold(
      body: new Card(
          child: new Center(
        child: new Text('กดอีกครั้งเพื่อออกจากแอป...',
            style: new TextStyle(
                fontSize: 24.00,
                fontWeight: FontWeight.bold,
                color: Colors.indigo)),
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // readData();
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        storage: UserNameStorage(),
      ),
      routes: {
        '/home': (context) => home(),
        '/menu': (context) => menu(storage: UserNameStorage()),
      },
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
