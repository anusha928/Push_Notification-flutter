import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  //initializing firebase messaging

  FirebaseMessaging messaging = FirebaseMessaging.instance;

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
