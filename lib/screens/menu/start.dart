import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:feed_app/utility/device.dart';
import 'package:feed_app/utility/netpie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../menu.dart';
import '../sign_in.dart';

class Start extends StatefulWidget {
  const Start({Key? key, required this.storage}) : super(key: key);
  final UserNameStorage storage;

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    super.initState();
    remeber();
    
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('อนุญาตการแจ้งเตือน'),
            content: Text(
                'ดูเหมือนว่าแอปของคุณยังไม่ได้รับให้มีการแจ้งเตือน โปรดอนุญาตเพื่อเข้าถึงการแจ้งเตือน FeedApp'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });
//      AwesomeNotifications().createdStream.listen((notification) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//           'Notification Created on ${notification.channelKey}',
//         ),
//       ));
//     });
//  AwesomeNotifications().actionStream.listen((notification) {
//       if (notification.channelKey == 'basic_channel') {
//         AwesomeNotifications().getGlobalBadgeCounter().then(
//               (value) =>
//                   AwesomeNotifications().setGlobalBadgeCounter(value - 1),
//             );
//       }

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (_) => menu(storage: UserNameStorage()),
//         ),
//         (route) => route.isFirst,
//       );
//     });
  }

  var _usernameSeve;

  late String showTime;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp2-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;
  var mapda;

//Method


  remeber() {
    return widget.storage.readUeserName().then((String value) async {
      _usernameSeve = value;
      await db
          .child('/user/run/$_usernameSeve')
          .once()
          .then((DataSnapshot snapshot) {
        mapda = snapshot.value;
      }).onError((error, stackTrace) => null);
      print(_usernameSeve);
      // print(mapda);
      print('goooooo $mapda');
      incrementWebAPI(mapda);
    }
    
    );
  }

//Explicit
  publish(
    String iMsg,
  ) async {
    Response response = await http.put(
      Uri.parse(await mapda),
      body: iMsg,
    );
    print('Pesponse: ${response.body}');
  }

  Widget button1() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 10 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });
        remeber();
        publish('auto cat feed 10');
        
      },
    );
  }

  Widget button2() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 20 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async{
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });
        publish('auto cat feed 20');
        remeber();
      },
    );
  }

  Widget button3() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 30 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });

        publish('auto cat feed 30');
      },
    );
  }

  Widget button4() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 40 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });

        publish('auto cat feed 40');
      },
    );
  }

  Widget button5() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 50 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });

        publish('auto cat feed 50');
      },
    );
  }

  Widget text0() {
    return Text("         ");
  }

  Widget text3() {
    return Text("ควบคุมเอง", style: TextStyle(fontSize: 30));
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การใช้งาน'),
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
      ),
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.cyan,
                  Colors.indigo,
                ],
              )),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text3()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button1(), text0(), button2()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button3(), text0(), button4()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button5()],
                    ),
                    
                  ],
                ),
              ))),
    );
  }
}

class Test2 {
  // String _deviceID = "1540e038-547a-43ae-883e-a3399320c3ee";
  // String _deviceToken = "DFA3FTc3au8HCTtmDYknMw5FAM3NCW9t";

  // bool _led = false;
  // String _temp = "";
  // String _humid = "";

//   String apiUrl = 'https://api.netpie.io/topic/FeedAppFlutter/com_example_feedApp"ค่าที่จะส่ง"-u 2os3ZPk6GN50Hkz:7BZSJD8JD7gYDxWQvp1lPIrTQ';
//https://api.netpie.io/topic/app8266/gearname/Servo?auth=2os3ZPk6GN50Hkz:7BZSJD8JD7gYDxWQvp1lPIrTQ
//   coap://coap.netpie.io/message/home/servo0?auth=1540e038-547a-43ae-883e-a3399320c3ee:DFA3FTc3au8HCTtmDYknMw5FAM3NCW9t"
}

// class DogService {
//   static randomDog() {
//     var url = "https://dog.ceo/api/breeds/image/random";
//     Http.get(Uri.http(authority, unencodedPath)).then((response) {
//       print("Response status: ${response.body}");
//     });
//   }
// }



// method time