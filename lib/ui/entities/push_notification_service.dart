import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  PushNotificationService._();
  static final PushNotificationService  instance =PushNotificationService._();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    //foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print (message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });
    //background notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print (message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });

    FirebaseMessaging.onBackgroundMessage(doNothing);
    String? token = await getToken();
    print(token);
  }

  Future<String?> getToken() async{
    String? token = await _firebaseMessaging.getToken();
    return token;
  }


}

Future<void> doNothing(RemoteMessage remoteMessage) async {

}