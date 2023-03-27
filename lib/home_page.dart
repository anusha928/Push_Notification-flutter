import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification/notification_services.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationServices services = NotificationServices();

  @override
  void initState() {
    services.requestNotificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
