import 'dart:io';
import 'dart:core';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/screens/menu.dart';
import 'package:feed_app/utility/notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../sign_in.dart';

class autoTime extends StatefulWidget {
  const autoTime({Key? key, required this.storage}) : super(key: key);
  final UserNameStorage storage;
  @override
  _autoTimeState createState() => _autoTimeState();
}

enum SingingCharacter { A, B, C, D }

class _autoTimeState extends State<autoTime>{

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('อนุญาตการแจ้งเตือน'),
            content: Text('ดูเหมือนว่าแอปของคุณยังไม่ได้รับให้มีการแจ้งเตือน โปรดอนุญาตเพื่อเข้าถึงการแจ้งเตือน FeedApp'),
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


    
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }
  
  


  // @override
  // void dispose() {
  //   AwesomeNotifications().actionSink.close();
  //   AwesomeNotifications().createdSink.close();
  //   super.dispose();
  // }

  
  var _usernameSeve;

  late String showTime;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp2-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;
  var mapda;
  late String set_value = 'auto cat feed 10';



  

//Method
  Future<void> readData() async {
    print('Work!!!');

    await db.child('/user/run').once().then((DataSnapshot snapshot) {
      mapdata = snapshot.value;
    }).onError((error, stackTrace) => null);

    print(mapdata);
  }

  Future<void> remeber() async {
    return await widget.storage.readUeserName().then((String value) async {
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
    });
  }

//Explicit
 static  publish(String iMsg ,String mapda) async {
    Response response = await http.put(
      Uri.parse(mapda),
      body: iMsg,
    );
    print('Pesponse: ${response.body}');
  }

//  late NETPIE2020 netpie2020;

  TimeOfDay _time1 = TimeOfDay(hour: 0, minute: 00);
  TimeOfDay _time2 = TimeOfDay(hour: 0, minute: 00);
  TimeOfDay _time3 = TimeOfDay(hour: 0, minute: 00);
  TimeOfDay _time4 = TimeOfDay(hour: 0, minute: 00);
  TimeOfDay _time5 = TimeOfDay(hour: 0, minute: 00);



  void _selectTime1() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time1,
    );
    if (newTime != null) {
      setState(() {
        _time1 = newTime;
      });
    }
  }

  void _selectTime2() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time2,
    );
    if (newTime != null) {
      setState(() {
        _time2 = newTime;
      });
    }
  }

  void _selectTime3() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time3,
    );
    if (newTime != null) {
      setState(() {
        _time3 = newTime;
      });
    }
  }

  void _selectTime4() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time4,
    );
    if (newTime != null) {
      setState(() {
        _time4 = newTime;
      });
    }
  }

  void _selectTime5() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time5,
    );
    if (newTime != null) {
      setState(() {
        _time5 = newTime;
      });
    }
  }

  

  Widget  button5() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 50 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      
      onPressed: () async {
        
         createPlantFoodNotification();
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });
        // await remeber();
        // publish(set_value ,mapda);
        
      },
    );
  }

  static void printHello() {
  
  print("${DateTime.now()} Hello, world! ");
}

  Widget text0() {
    return Text("         ");
  }

  Widget text1() {
    return Text("ให้แบบตั้งเวลา", style: TextStyle(fontSize: 30));
  }

  Widget text2() {
    return Text("ปริมาณอาหารแบบตั้งเวลา", style: TextStyle(fontSize: 30));
  }

  Widget text3() {
    return Text("ควบคุมเอง", style: TextStyle(fontSize: 30));
  }

  Widget text4() {
    return Text('Selected time: ${_time1.format(context)}',
        style: TextStyle(fontSize: 15));
  }

  Widget text5() {
    return Text('Selected time: ${_time2.format(context)}',
        style: TextStyle(fontSize: 15));
  }

  Widget text6() {
    return Text('Selected time: ${_time3.format(context)}',
        style: TextStyle(fontSize: 15));
  }

  Widget text7() {
    return Text('Selected time: ${_time4.format(context)}',
        style: TextStyle(fontSize: 15));
  }

  Widget text8() {
    return Text('Selected time: ${_time5.format(context)}',
        style: TextStyle(fontSize: 15));
  }

  late String val10, val20, val30, val40;
  Widget button6() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _selectTime1();
      },
    );
  }

  Widget button7() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _selectTime2();
      },
    );
  }

  Widget button8() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _selectTime3();
      },
    );
  }

  Widget button9() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _selectTime4();
      },
    );
  }

  Widget button10() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _selectTime5();
      },
    );
  }

  SingingCharacter? _character = SingingCharacter.A;

  Widget raio1() {
    return ListTile(
      title: const Text('10 กรัม'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.A,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
            set_value = 'auto cat feed 10';
          });
          print(set_value);
        },
      ),
    );
  }

  Widget raio2() {
    return ListTile(
      title: const Text('20 กรัม'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.B,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
            set_value = 'auto cat feed 20';
          });
          print(set_value);

        },
      ),
    );
  }

  Widget raio3() {
    return ListTile(
      title: const Text('30 กรัม'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.C,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
            set_value = 'auto cat feed 30';
          });
          print(set_value);
        },
      ),
    );
  }

  Widget raio4() {
    return ListTile(
      title: const Text('40 กรัม'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.D,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
            set_value = 'auto cat feed 40';
          });
          print(set_value);
        },
      ),
    );
  }
//Explicit



  @override
  
  
  Widget build(BuildContext context) {


    
    return Scaffold(
      appBar: AppBar(
        title: Text('อัตโนมัติ'),
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
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.cyan,
                  Colors.indigo,
                ],
              )),
              child: Center(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text3()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button5()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text2()],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [raio1(), raio2(), raio3(), raio4()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text1(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text4(), text0(), text5()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button6(), text0(), button7()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text6(), text0(), text7()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button8(), text0(), button9()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text8()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button10(),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
