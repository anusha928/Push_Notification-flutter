import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_screen.dart';

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
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100).toString(), "High Importance Notification",
        importance: Importance.max,playSound: true);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: "Description",
            importance: Importance.high,
            playSound: true,
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

  void handleMessage(BuildContext context, RemoteMessage message) {
    if(message.data['type'] =='msg'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NotificationScreen(
            id: message.data['id'] ,
          )));
    }
  }

  Future<void> handleNotificationClickEventOnBackground(BuildContext context)async{
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }
    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void notificationInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((notification) {
      if (kDebugMode) {
        print(notification.notification!.title);
        print(notification.notification!.body);
        print(notification.data.toString());
        print(notification.data['type']);
        print(notification.data['id']);
      }
      if(Platform.isAndroid){
        localNotificationInit(context, notification);
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
