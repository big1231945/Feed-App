// class Device {
//   late String deviceid;
//   late Data data;
//   late int rev;
//   late int modified;

//   Device({required this.deviceid, required this.data, required this.rev, required this.modified});

//   Device.fromJson(Map<String, dynamic> json) {
//     deviceid = json['deviceid'];
//     data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
//     rev = json['rev'];
//     modified = json['modified'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['deviceid'] = this.deviceid;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     data['rev'] = this.rev;
//     data['modified'] = this.modified;
//     return data;
//   }
// }

// class Data {
//   late int humidity;
//   late String led;
//   late int temperature;

//   Data({required this.humidity, required this.led, required this.temperature});

//   Data.fromJson(Map<String, dynamic> json) {
//     humidity = json['humidity'];
//     led = json['led'];
//     temperature = json['temperature'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['humidity'] = this.humidity;
//     data['led'] = this.led;
//     data['temperature'] = this.temperature;
//     return data;
//   }
// }