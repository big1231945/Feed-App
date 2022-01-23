import 'dart:io';

import 'package:feed_app/utility/device.dart';
import 'package:feed_app/utility/netpie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

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
}

class Start extends StatefulWidget {
  const Start({Key? key, required this.storage}) : super(key: key);
  final UserNameStorage storage;
  @override
  _StartState createState() => _StartState();
}

enum SingingCharacter { A, B, C, D }

class _StartState extends State<Start> {
  var _usernameSeve;

  late String showTime;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp-1a08d-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;
  var mapda;

//Method
  Future<void> readData() async {
    print('Work!!!');

    await db.child('/user/run').once().then((DataSnapshot snapshot) {
      mapdata = snapshot.value;
    }).onError((error, stackTrace) => null);

    print(mapdata);
  }

  remeber() {
    return widget.storage.readUeserName().then((String value) {
      _usernameSeve = value;
      db.child('/user/run/$_usernameSeve').once().then((DataSnapshot snapshot) {
        mapda = snapshot.value;
      }).onError((error, stackTrace) => null);
      print(_usernameSeve);
      // print(mapda);
     print('goooooo $mapda');
    });
  }

//Explicit
  publish(
    String iMsg,
    String rESTAPIauth,
  ) async {
    // sent request secret
    String deviceAuth = rESTAPIauth;
    Response response = await http.put(
      Uri.parse(mapda +
          deviceAuth),
      body: iMsg,
    );
    print('Pesponse: ${response.body}');
  }

//  late NETPIE2020 netpie2020;
  final String _rESTAPIauth = "2os3ZPk6GN50Hkz:7BZSJD8JD7gYDxWQvp1lPIrTQ";

  TimeOfDay _time1 = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _time2 = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _time3 = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _time4 = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _time5 = TimeOfDay(hour: 7, minute: 15);

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

        publish('auto cat feed 10', _rESTAPIauth);
        readData();
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
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });

        publish('auto cat feed 20', _rESTAPIauth);
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

        publish('auto cat feed 30', _rESTAPIauth);
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

        publish('auto cat feed 40', _rESTAPIauth);
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

        publish('auto cat feed 50', _rESTAPIauth);
      },
    );
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
          });
          
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
          });
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
          });
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
          });
        },
      ),
    );
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
                      children: [text1(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text4(),text0(),text5()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button6(), text0(), button7()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text6(),text0(),text7()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [button8(), text0(), button9()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text8()
                      ],
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