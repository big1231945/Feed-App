import 'package:feed_app/utility/device.dart';
import 'package:feed_app/utility/netpie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
//Explicit
  publish(
    String iMsg,
    String rESTAPIauth,
  ) async {
    // sent request secret
    String deviceAuth = rESTAPIauth;
    Response response = await http.put(
      Uri.parse("https://api.netpie.io/topic/app8266/gearname/Servo?auth=" +
          deviceAuth),
      body: iMsg,
    );
    print('Pesponse: ${response.body}');
  }

//  late NETPIE2020 netpie2020;
  String _rESTAPIauth = "2os3ZPk6GN50Hkz:7BZSJD8JD7gYDxWQvp1lPIrTQ";

  bool _led = false;
  String _temp = "";
  String _humid = "";

  Widget button5() {
    return RaisedButton(
      color: Colors.cyan,
      child: Text(
        'กดดูสิ',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // netpie2020
        //   .publish('servo0',_rESTAPIauth).then((res) {
        //   });

        publish('auto cat feed 200', _rESTAPIauth);
      },
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
          children: [button5()],
        ),
      ),
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