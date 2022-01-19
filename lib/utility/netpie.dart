// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// // import 'package:feed_app/utility/device.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class NETPIE2020 {
//   // publish message iMsg
//   // publish(
//   //     String iMsg, String rESTAPIauth, ) async {
//   //   // sent request secret
//   //   String deviceAuth = rESTAPIauth;   
//   //   Response response =
//   //       await http.post(Uri.parse("https://api.netpie.io/topic/app8266/gearname/Servo?auth="+deviceAuth) ,
//   //           // headers: <String, String>{
//   //           //   'Authorization': deviceAuth,
//   //           // }
            
//   //             body:{iMsg},
      
//   //           );
//   //   print('Pesponse: ${response.body}');
//   // }
//   // // read data from shadow
//   // Future<Device> readShadow(String key, String secret) async {
//   //   // sent request secret
//   //   String deviceAuth = 'Device ' + key + ":" + secret;
//   //   Response response = await http.get(
//   //     Uri.parse("https://api.netpie.io/v2/device/shadow/data"),
//   //     headers: <String, String>{
//   //       'Authorization': deviceAuth,
//   //     },
//   //   );
//   //   log("statusCode -> " + response.statusCode.toString());
//   //   log("jsonBody -> " + response.body.toString());
//   //   return Device.fromJson(json.decode(response.body));
//   // }
// }
