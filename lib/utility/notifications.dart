import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:feed_app/utility/data_user.dart';
import 'package:feed_app/utility/utilities.dart';

Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
          '${Emojis.cat_cat_with_wry_smile + Emojis.food_bowl_with_spoon} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง',
      // bigPicture: 'images/notification_map.png',
      // notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

Future<void> createWaterReminderNotification1(
    NotificationWeekAndTime notificationSchedule) async {
      // RunBackgorude instance01 = RunBackgorude();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'scheduled_channel',
      title: '${Emojis.cat_cat_with_wry_smile} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: '1',
        label: 'Check',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
   
    

  );
}
Future<void> createWaterReminderNotification2(
    NotificationWeekAndTime notificationSchedule) async {
      // RunBackgorude instance01 = RunBackgorude();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'scheduled_channel',
      title: '${Emojis.cat_cat_with_wry_smile} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: '2',
        label: 'Check',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
   
    

  );
}
Future<void> createWaterReminderNotification3(
    NotificationWeekAndTime notificationSchedule) async {
      // RunBackgorude instance01 = RunBackgorude();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'scheduled_channel',
      title: '${Emojis.cat_cat_with_wry_smile} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: '3',
        label: 'Check',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
   
    

  );
}
Future<void> createWaterReminderNotification4(
    NotificationWeekAndTime notificationSchedule) async {
      // RunBackgorude instance01 = RunBackgorude();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 4,
      channelKey: 'scheduled_channel',
      title: '${Emojis.cat_cat_with_wry_smile} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: '4',
        label: 'Check',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
   
    

  );
}
Future<void> createWaterReminderNotification5(
    NotificationWeekAndTime notificationSchedule) async {
      // RunBackgorude instance01 = RunBackgorude();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 5,
      channelKey: 'scheduled_channel',
      title: '${Emojis.cat_cat_with_wry_smile} FeedCat ทำงานแล้ว',
      body: 'FeedCat เริ่มการให้อาหารแมวของคุณแล้ว สามารถดูได้ที่กล้อง.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: '5',
        label: 'Check',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
   
    

  );
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
