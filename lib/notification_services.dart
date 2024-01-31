import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  //initializing firebase messaging

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //adding local notification plugin

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

//initializing local notification
  void localNotificationInit(
      BuildContext context, RemoteMessage message) async {
    //android initialization
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    //ios initialization
    // DarwinInitializationSettings();

    var initializationSetting =
        InitializationSettings(android: androidInitializationSettings);
    //calling plugin
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {},
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100).toString(), "High Importance Notification",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: "Description",
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(android: androidNotificationDetails));
    });

    
  }

  void notificationInit() {
    FirebaseMessaging.onMessage.listen((notification) {
      if (kDebugMode) {
        print(notification.notification!.title);
        print(notification.notification!.body);
      }
      showNotification(notification);
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        provisional: true,
        criticalAlert: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Permission granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Provisional");
    } else {
      print("Request denied");
    }
  }

  //getting device token
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

//checking the expiry of token
  void refreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
