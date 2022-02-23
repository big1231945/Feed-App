import 'package:feed_app/screens/menu/auto_time.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<String> loadUsernameData() async {
  final prefs = await SharedPreferences.getInstance();
  String _username;
  _username = (prefs.getString('username'))!;
  return _username;
}

Future<String> loadUrlNetpie() async {
  final prefs = await SharedPreferences.getInstance();
  String urlNetpie;
  urlNetpie = (prefs.getString('UrlNetpie'))!;
  return urlNetpie;
}

Future<String> loadWebAPI() async {
  final prefs = await SharedPreferences.getInstance();
  String webAPI;
  webAPI = (prefs.getString('WebAPI'))!;
  return webAPI;
}

void incrementUsernameData(String _username) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('username', _username);
}

void incrementUrlNetpie(String urlNetpie) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('UrlNetpie', urlNetpie);
}

void incrementWebAPI(String webAPI) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('WebAPI', webAPI);
}

void incrementValue(String value) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('ValueFeed', value);
}
Future<String> loadValue() async {
  final prefs = await SharedPreferences.getInstance();
  String value;
  value = (prefs.getString('ValueFeed'))!;
  return value;
}

void deleteUsernameData() async {
  final prefs = await SharedPreferences.getInstance();
  String _username = '';

  prefs.setString('username', _username);
}

void deleteWebAPI() async {
  final prefs = await SharedPreferences.getInstance();
  String webAPI = '';

  prefs.setString('WebAPI', webAPI);
}
void deleteUrlNetpie() async {
  final prefs = await SharedPreferences.getInstance();
  String webAPI = '';

  prefs.setString('UrlNetpie', webAPI);
}
void deleteCam() async {
  final prefs = await SharedPreferences.getInstance();
  String cam = '';

  prefs.setString('Cam', cam);
}

void deleteValue() async {
  final prefs = await SharedPreferences.getInstance();
  String value = '';

  prefs.setString('ValueFeed', value);
}

void incrementCam(String cam) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('Cam', cam);
}
Future<String> loadCam() async {
  final prefs = await SharedPreferences.getInstance();
  String cam;
  cam = (prefs.getString('Cam'))!;
  return cam;
}

void fireAlarm() {
  print('Alarm Fired at ${DateTime.now()}');
}


class RunBackgorude {
  final DatabaseReference db = FirebaseDatabase(
          databaseURL:
              'https://feedapp2-default-rtdb.asia-southeast1.firebasedatabase.app')
      .reference();
  var mapdata;
  var mapda;

//Method

  remeber() {
    return () async {
      await db
          .child('/user/run/$loadUsernameData')
          .once()
          .then((DataSnapshot snapshot) {
        mapda = snapshot.value;
      }).onError((error, stackTrace) => null);
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
}
