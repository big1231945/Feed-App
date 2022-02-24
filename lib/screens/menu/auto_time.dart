import 'dart:async';
import 'dart:core';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:feed_app/utility/notifications.dart';
import 'package:feed_app/utility/save_state.dart';
import 'package:feed_app/utility/utilities.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../sign_in.dart';

class autoTime extends StatefulWidget {
  const autoTime({Key? key, required this.storage}) : super(key: key);
  final UserNameStorage storage;
  @override
  _autoTimeState createState() => _autoTimeState();
}

class _autoTimeState extends State<autoTime> {
  late Timer _timer;
  TimeOfDay? timeOfDay;
  var _selectedValueFeed = ValueFeed.Value10;
  final _preferencesService = PreferencesSettingsVal();
  final showTimeSet = ShowTimeSet();

  testtime() async {
    final show = await showTimeSet.getTimeSet();
    return show.time1;
  }

  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  // runAutoTime1() async {
  //   final show = await showTimeSet.getTimeSet();
  //   if (DateTime.now().hour == stringToTimeOfDay(show.time1).hour &&
  //       DateTime.now().minute == stringToTimeOfDay(show.time1).minute &&
  //       DateTime.now().second == 0) {
  //     _usernameSeve = await loadUsernameData();
  //     // await remeber();
  //     print('work');
  //     publish(await loadValue());
  //   }
  // }

  // runAutoTime2() async {
  //   final show = await showTimeSet.getTimeSet();
  //   if (DateTime.now().hour == stringToTimeOfDay(show.time2).hour &&
  //       DateTime.now().minute == stringToTimeOfDay(show.time2).minute &&
  //       DateTime.now().second == 0) {
  //     _usernameSeve = await loadUsernameData();
  //     print('work');
  //     publish(await loadValue());
  //   }
  //   ;
  // }

  // runAutoTime3() async {
  //   final show = await showTimeSet.getTimeSet();
  //   if (DateTime.now().hour == stringToTimeOfDay(show.time3).hour &&
  //       DateTime.now().minute == stringToTimeOfDay(show.time3).minute &&
  //       DateTime.now().second == 0) {
  //     _usernameSeve = await loadUsernameData();
  //     print('work');
  //     publish(await loadValue());
  //   }
  //   ;
  // }

  // runAutoTime4() async {
  //   final show = await showTimeSet.getTimeSet();
  //   if (DateTime.now().hour == stringToTimeOfDay(show.time4).hour &&
  //       DateTime.now().minute == stringToTimeOfDay(show.time4).minute &&
  //       DateTime.now().second == 0) {
  //     _usernameSeve = await loadUsernameData();
  //     print('work');
  //     publish(await loadValue());
  //   }
  //   ;
  // }

  // runAutoTime5() async {
  //   final show = await showTimeSet.getTimeSet();
  //   if (DateTime.now().hour == stringToTimeOfDay(show.time5).hour &&
  //       DateTime.now().minute == stringToTimeOfDay(show.time5).minute &&
  //       DateTime.now().second == 0) {
  //     _usernameSeve = await loadUsernameData();
  //     print('work');
  //     publish(await loadValue());
  //   }
  //   ;
  // }

  @override
  void initState() {
    // Timer _timer;
    // DateTime a;
    // runs every 1 second

    // _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
    //   runAutoTime1();
    //   // runAutoTime2();
    //   // runAutoTime3();
    //   // runAutoTime4();
    //   // runAutoTime5();
    // });

    setState(() {
      now = DateTime.now();
    });
    remeber();

    super.initState();

    _populateFields();
    showTimeState();

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
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    _timer.cancel();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   AwesomeNotifications().actionSink.close();
  //   AwesomeNotifications().createdSink.close();
  //   super.dispose();
  // }

  var _usernameSeve;

  var mapdata;
  var mapda;
  late String set_value = 'auto cat feed 10';

//Method
  remeber() async {
    _usernameSeve = await loadUsernameData();
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

//Method
  Future<void> readData() async {
    print('Work!!!');

    await db.child('/user/run').once().then((DataSnapshot snapshot) {
      mapdata = snapshot.value;
    }).onError((error, stackTrace) => null);

    print(mapdata);
  }

//Explicit

//  late NETPIE2020 netpie2020;

  Widget button55() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'ให้อาหาร 50 กรัม',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // print(DateFormat('HH:mm:ss').format());
        // createPlantFoodNotification();
        // print(loadWebAPI);
        // await AndroidAlarmManager.oneShot(const Duration(seconds: 5), 1, publish('auto cat feed 10'));
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });
        // await remeber();
        // publish('auto cat feed 10');
        publish(await loadValue());
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
    return Text('', style: TextStyle(fontSize: 30));
  }

  Widget text4() {
    return Text('เวลาที่เลือก: ${Time1}', style: TextStyle(fontSize: 15));
  }

  Widget text5() {
    return Text('เวลาที่เลือก: ${Time2}', style: TextStyle(fontSize: 15));
  }

  Widget text6() {
    return Text('เวลาที่เลือก: ${Time3}', style: TextStyle(fontSize: 15));
  }

  Widget text7() {
    return Text('เวลาที่เลือก: ${Time4}', style: TextStyle(fontSize: 15));
  }

  Widget text8() {
    return Text('เวลาที่เลือก: ${Time5}', style: TextStyle(fontSize: 15));
  }

  late String val10, val20, val30, val40;
  String Time1 = 'HH:MM',
      Time2 = 'HH:MM',
      Time3 = 'HH:MM',
      Time4 = 'HH:MM',
      Time5 = 'HH:MM';
  void showTime() {
    final newSeveTimeSet = SaveTimeSet(
        time1: Time1, time2: Time2, time3: Time3, time4: Time4, time5: Time5);
    print(newSeveTimeSet);
    showTimeSet.saveTimeSet(newSeveTimeSet);
  }

  var showTimeSaveState = TextEditingController();
  void showTimeState() async {
    final show = await showTimeSet.getTimeSet();
    setState(() {
      Time1 = show.time1;
      Time2 = show.time2;
      Time3 = show.time3;
      Time4 = show.time4;
      Time5 = show.time5;
    });
  }

  Widget button1() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // _selectTime1();
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

        if (pickedSchedule != null) {
          createWaterReminderNotification1(pickedSchedule);
          // publish('auto cat feed 10');
          setState(() {
            Time1 = pickedSchedule.timeOfDay.format(context);
            showTime();

            
          });
          TimeOfDay _time = TimeOfDay(
                hour: int.parse(Time1.split(":")[0]),
                minute: int.parse(Time1.split(":")[1].split(" ")[0]));
          cron.schedule(
              Schedule(
                  hours: _time.hour,
                  minutes: _time.minute),
              () async=> publish(await loadValue())
              );
        }
      },
    );
  }

  final cron = Cron();

  Widget button2() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // _selectTime2();
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

        if (pickedSchedule != null) {
          createWaterReminderNotification2(pickedSchedule);
          // publish('auto cat feed 10');
          setState(() {
            Time2 = pickedSchedule.timeOfDay.format(context);
            showTime();
          });
          TimeOfDay _time = TimeOfDay(
                hour: int.parse(Time2.split(":")[0]),
                minute: int.parse(Time2.split(":")[1].split(" ")[0]));
          cron.schedule(
              Schedule(
                  hours: _time.hour,
                  minutes: _time.minute),
              () async=> publish(await loadValue())
              );

              
        }
      },
    );
  }

  Widget button3() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // _selectTime3();
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

        if (pickedSchedule != null) {
          createWaterReminderNotification3(pickedSchedule);
          // publish('auto cat feed 10');
          setState(() {
            Time3 = pickedSchedule.timeOfDay.format(context);
            showTime();
          });
          TimeOfDay _time = TimeOfDay(
                hour: int.parse(Time3.split(":")[0]),
                minute: int.parse(Time3.split(":")[1].split(" ")[0]));
          cron.schedule(
              Schedule(
                  hours: _time.hour,
                  minutes: _time.minute),
              () async=> publish(await loadValue())
              );
        }
      },
    );
  }

  Widget button4() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // _selectTime4();
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

        if (pickedSchedule != null) {
          createWaterReminderNotification4(pickedSchedule);
          // publish('auto cat feed 10');
          setState(() {
            Time4 = pickedSchedule.timeOfDay.format(context);
            showTime();
          });
          TimeOfDay _time = TimeOfDay(
                hour: int.parse(Time4.split(":")[0]),
                minute: int.parse(Time4.split(":")[1].split(" ")[0]));
          cron.schedule(
              Schedule(
                  hours: _time.hour,
                  minutes: _time.minute),
              () async=> publish(await loadValue())
              );
        }
      },
    );
  }

  Widget button5() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'เลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        // _selectTime5();
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

        if (pickedSchedule != null) {
          createWaterReminderNotification5(pickedSchedule);
          // publish('auto cat feed 10');
          setState(() {
            Time5 = pickedSchedule.timeOfDay.format(context);
            showTime();
          });
          TimeOfDay _time = TimeOfDay(
                hour: int.parse(Time5.split(":")[0]),
                minute: int.parse(Time5.split(":")[1].split(" ")[0]));
          cron.schedule(
              Schedule(
                  hours: _time.hour,
                  minutes: _time.minute),
              () async=> publish(await loadValue())
              );
        }
      },
    );
  }

  Widget button6() {
    return RaisedButton(
      color: Colors.deepOrange[800],
      child: Text(
        'ล้างข้อมูลการเลือกเวลา',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        final show = await showTimeSet.DeleteTimeSet();
        cancelScheduledNotifications();
        cron.close();
        setState(() {
          show;
          showTimeState();
        });
      },
    );
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettingsVal();
    setState(() {
      _selectedValueFeed = settings.valueFeed;
    });
  }

  void _saveSettings() {
    final newSettings = SettingsValFeed(valueFeed: _selectedValueFeed);
    print(newSettings);
    _preferencesService.saveSettingsVal(newSettings);
  }

  Widget raioVal() {
    return RadioListTile(
        title: Text('10 กรัม'),
        value: ValueFeed.Value10,
        groupValue: _selectedValueFeed,
        onChanged: (ValueFeed? newValue) {
          incrementValue('auto cat feed 10');
          setState(() {
            _selectedValueFeed = newValue!;
            _saveSettings();
          });
        });
  }

  Widget raioVal2() {
    return RadioListTile(
        title: Text('20 กรัม'),
        value: ValueFeed.Value20,
        groupValue: _selectedValueFeed,
        onChanged: (ValueFeed? newValue) {
          incrementValue('auto cat feed 20');
          setState(() {
            _selectedValueFeed = newValue!;
            _saveSettings();
          });
        });
  }

  Widget raioVal3() {
    return RadioListTile(
        title: Text('30 กรัม'),
        value: ValueFeed.Value30,
        groupValue: _selectedValueFeed,
        onChanged: (ValueFeed? newValue) {
          incrementValue('auto cat feed 30');
          setState(() {
            _selectedValueFeed = newValue!;
            _saveSettings();
          });
        });
  }

  Widget raioVal4() {
    return RadioListTile(
        title: Text('40 กรัม'),
        value: ValueFeed.Value40,
        groupValue: _selectedValueFeed,
        onChanged: (ValueFeed? newValue) {
          incrementValue('auto cat feed 40');
          setState(() {
            _selectedValueFeed = newValue!;
            _saveSettings();
          });
        });
  }

  Widget showAppLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/8124753.png'),
    );
  }

  Widget text00() {
    return Text(
      "         ",
      style: TextStyle(height: 3),
    );
  }
//Explicit

  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('HH:mm:ss').format(now);

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
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.white,
                  Colors.cyan,
                ],
              )),
              child: IndexedStack(children: [
                ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text00()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [showAppLogo()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text2()],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [raioVal(), raioVal2(), raioVal3(), raioVal4()],
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
                      children: [button1(), text0(), button2()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text6(), text0(), text7()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button3(), text0(), button4()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text8()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button5(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // button55(), 
                      button6()],
                    ),
                  ],
                ),
              ]))),
    );
  }
}
