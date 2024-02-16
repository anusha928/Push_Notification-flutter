import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'notification_services.dart';
// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
    State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.notificationInit(context);
    notificationServices.handleNotificationClickEventOnBackground(context);
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen")
          ],
        ),
      ),
    );
  }
}
