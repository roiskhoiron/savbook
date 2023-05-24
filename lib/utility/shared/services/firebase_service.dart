import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/local_notification_helper.dart';

@deprecated
class FirebaseCloudMessage {
  static var tag = 'Instance "FirebaseCloudMessage"';

  static Future<void> initializeFCM(
      {required void Function(String token) onTokenChanged,
      void Function(Map<String, dynamic> data)? onNotificationPressed,
      void Function(dynamic data)? onNotificationAlready,
      GlobalKey<NavigatorState>? navigatorKey,
      required String icon}) async {
    await LocalNotification.initializeLocalNotification(
        onNotificationPressed: onNotificationPressed, icon: icon);

    await Firebase.initializeApp();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => onTokenChanged(value ?? ''));

    Stream<String> tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    tokenStream.listen(onTokenChanged);

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      Get.log('$tag getInitialMessage()');
      if (message != null) {
        Get.log('$tag $message');
        if (navigatorKey != null) {
          Timer.periodic(
            const Duration(milliseconds: 500),
            (timer) {
              if (navigatorKey.currentState == null) return;
              onNotificationPressed!(message.data);
              timer.cancel();
            },
          );
        }
      }
    });

    FirebaseMessaging.onMessage.listen(showNotif);

    FirebaseMessaging.onMessage.listen(
      (event) => onNotificationAlready,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(showNotif);

    FirebaseMessaging.onBackgroundMessage(
        (RemoteMessage message) async => showNotif(message));

    FirebaseMessaging.onBackgroundMessage(
        (RemoteMessage message) async => onNotificationAlready);

    return;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    showNotif(message);
  }

  static void showNotif(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    Get.log(
        '$tag onMessage => \nnotification : ${message.notification != null ? message.notification!.title : 'tidak ada title'} \ndata :${json.encode(message.data).toString()}');

    Get.log('A new onMessageOpenedApp event was published!');
    Get.log('A new onBackgroundMessage event was published!');

    if (notification != null && android != null) {
      Get.log('title notif ${notification.title}');
      Get.log('title body ${notification.body}');
      LocalNotification.showNotification(
          notification: notification, payload: message.data, icon: 'app_icon');
    } else if (message.data.isNotEmpty) {
      final ejson = Ejson.fromJson(jsonDecode(message.data['ejson']));
      // LocalNotification.showMessageNotification(
      //     payload: message.data, icon: 'app_icon', ejson: ejson);
    }
  }
}

Ejson ejsonFromJson(String str) => Ejson.fromJson(json.decode(str));

String ejsonToJson(Ejson data) => json.encode(data.toJson());

class Ejson {
  Ejson({
    required this.host,
    required this.rid,
    required this.sender,
    required this.type,
    required this.messageId,
  });

  String host;
  String rid;
  Sender sender;
  String type;
  String messageId;

  factory Ejson.fromJson(Map<String, dynamic> json) => Ejson(
        host: json["host"],
        rid: json["rid"],
        sender: Sender.fromJson(json["sender"]),
        type: json["type"],
        messageId: json["messageId"],
      );

  Map<String, dynamic> toJson() => {
        "host": host,
        "rid": rid,
        "sender": sender.toJson(),
        "type": type,
        "messageId": messageId,
      };
}

class Sender {
  Sender({
    required this.id,
    required this.username,
  });

  String id;
  String username;

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
      };
}
