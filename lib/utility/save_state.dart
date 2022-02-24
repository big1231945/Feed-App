import 'package:feed_app/screens/menu/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ValueFeed { Value10, Value20, Value30,Value40 }

class SettingsValFeed {
  final ValueFeed valueFeed;
  SettingsValFeed(
      {required this.valueFeed});
}
class PreferencesSettingsVal{
  Future saveSettingsVal(SettingsValFeed SettingsVal) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('valueFeed', SettingsVal.valueFeed.index);
    print('Saved SettingsVal');
  }
  Future<SettingsValFeed> getSettingsVal() async {
    final preferences = await SharedPreferences.getInstance();
    final valueFeed = ValueFeed.values[preferences.getInt('valueFeed') ?? 0];

    return SettingsValFeed(
        valueFeed: valueFeed);
  }
}

class SaveTimeSet {
    final String time1;
    final String time2;
    final String time3;
    final String time4;
    final String time5;
    SaveTimeSet({ required this.time1,required this.time2,required this.time3,required this.time4,required this.time5, });
}
class ShowTimeSet {
  Future saveTimeSet(SaveTimeSet saveTimeSet)async{
    final pefs = await SharedPreferences.getInstance();
    await pefs.setString('time1', saveTimeSet.time1);
    await pefs.setString('time2', saveTimeSet.time2);
    await pefs.setString('time3', saveTimeSet.time3);
    await pefs.setString('time4', saveTimeSet.time4);
    await pefs.setString('time5', saveTimeSet.time5);
  }
  Future<SaveTimeSet>getTimeSet() async{
    final pefs = await SharedPreferences.getInstance();
    final time1 = pefs.getString('time1');
    final time2 = pefs.getString('time2');
    final time3 = pefs.getString('time3');
    final time4 = pefs.getString('time4');
    final time5 = pefs.getString('time5');
    return SaveTimeSet(time1: time1!, 
    time2: time2!, 
    time3: time3!, 
    time4: time4!, 
    time5: time5!);
  }
  Future DeleteTimeSet()async{
    final pefs = await SharedPreferences.getInstance();
    await pefs.setString('time1', 'HH:MM');
    await pefs.setString('time2', 'HH:MM');
    await pefs.setString('time3', 'HH:MM');
    await pefs.setString('time4', 'HH:MM');
    await pefs.setString('time5', 'HH:MM');
  }
}