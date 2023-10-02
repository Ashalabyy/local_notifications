import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:notifications/notification_repo.dart';

class NotificationRepoImp implements NotficationRepo {
  @override
  Future<void> createNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1, channelKey: 'basic key', title: 'Terra', body: '''
Get 15% on Citrus 🍋` 
'''),
    );
  }

  @override
  Future<void> scheduledNotifications() async {
    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(
          const Duration(seconds: 3),
        ),
      ),
      content: NotificationContent(
        id: 1,
        channelKey: 'scheduled key',
        title: 'Terra',
        body: '''
Get 15% on Citrus 🍋` 
''',
      ),
    );
  }
}
