import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/screens/home.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
//Explicit
  Widget button5() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'Logout',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        deleteUsernameData();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => home(),
          ),
          (route) => route.isFirst,
        );
      },
    );
  }

  Widget button() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ปิดการแจ้งเตือน',
        style: TextStyle(color: Colors.white),
      ),
      onPressed:() => 
        AwesomeNotifications()
            .showAlarmPage()
            .then((_) => Navigator.pop(context)),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า'),
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
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: [button(), button5()],
        ),
      ),
    );
  }
}
