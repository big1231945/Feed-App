import 'package:feed_app/utility/data_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final TimeOfDay timeOfDay;


  NotificationWeekAndTime({
    required this.timeOfDay,
  });
}
final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp2-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;
  var mapda;
  late String set_value = 'auto cat feed 10';






//Method


  remeber() {
    return () async {

      await db
          .child('/user/run/$loadUsernameData')
          .once()
          .then((DataSnapshot snapshot) {
        mapda = snapshot.value;
      }).onError((error, stackTrace) => null);
      print(loadUsernameData);
      // print(mapda);
      print('goooooo $mapda');
    };
  }

//Explicit
  publish(
    String iMsg,
  ) async {
    Response response = await http.put(
      Uri.parse(loadWebAPI.toString()),
      body: iMsg,
    );
    print('Pesponse: ${response.body}');
  }

Future<NotificationWeekAndTime?> pickSchedule(
  BuildContext context,
) async {
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  


  if (null == null) {
    timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          now.add(
            Duration(minutes: 1),
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return 
          
          Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.teal,
              ),
            ),
            child: child!,
          );
        });

    if (timeOfDay != null) {
      return NotificationWeekAndTime(
          timeOfDay: timeOfDay);
          
    }
  }
  return null;
}

