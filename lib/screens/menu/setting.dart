import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/screens/home.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:feed_app/utility/notifications.dart';
import 'package:feed_app/utility/save_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  final showTimeSet = ShowTimeSet();
//Explicit
  Widget button5() {
    return RaisedButton(
      color: Colors.red,
      child: Text(
        'Logout',
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
      onPressed: () async {
        deleteUsernameData();
        deleteUrlNetpie();
        deleteWebAPI();
        cancelScheduledNotifications();
        deleteCam();
        deleteValue();
        final show = await showTimeSet.DeleteTimeSet();

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
      color: Colors.lightBlue,
      child: Text(
        'ปิดการแจ้งเตือน',
        style: TextStyle(color: Colors.white,fontSize: 20),
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

       body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
        image: AssetImage('images/backgrund2.jpg'),
        fit: BoxFit.cover),
  ),
              //     gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: <Color>[
              //     Colors.white,
              //     Colors.yellow.shade200,
              //   ],
              // )),
              child:  Form(
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: [button(), button5()],
        ),
      ),
          )
       )
    );
  }
}
