import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notification_repo.dart';
import 'notification_repo_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    'resource://drawable/only',
    [
      NotificationChannel(
        channelKey: 'basic key',
        channelName: 'test channel',
        channelDescription: 'Terra got 15 %',
        playSound: true,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled key',
        channelName: 'test channel',
        channelDescription: 'Terra got 15 %',
        playSound: true,
        channelShowBadge: true,
      ),
    ],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<NotficationRepo>.value(
      value: NotificationRepoImp(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width * 0.7;
    final data = Provider.of<NotficationRepo>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Local Notifications',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(deviceWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                data.createNotification();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.notifications),
                  Text(
                    'Local Notifications',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(deviceWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                data.scheduledNotifications();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.notifications),
                  Text(
                    'scheduled Notifications',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
