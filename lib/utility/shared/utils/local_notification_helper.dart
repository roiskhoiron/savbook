import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:savbook/utility/shared/services/firebase_messaging_service.dart';

@deprecated
class LocalNotification {
  /// Create a [AndroidNotificationChannel] for heads up notifications
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.high,
  );

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static initializeLocalNotification(
      {void Function(Map<String, dynamic> data)? onNotificationPressed,
      String? icon}) async {
    // Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    Get.log('icon : $icon');
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(icon!);
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //         onDidReceiveLocalNotification: (id, title, body, payload) =>
    //             onDidReceiveLocalNotification(id, title!, body!, payload!));
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (payload) {
      //   return onSelectNotification(
      //       payload: payload, onData: onNotificationPressed);
      // },
    );
  }

  static void onSelectNotification({String? payload, onData}) async {
    if (payload != null) {
      Get.log('notification payload: $payload');

      var jsonData = jsonDecode(payload);
      onData(jsonData);
    }
  }

  static showNotification(
      {required RemoteNotification notification,
      required Map<String, dynamic> payload,
      required String icon}) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: icon,
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true),
      ),
      payload: jsonEncode(payload),
    );
  }

  static showNotificationOnClose(
      {required int hashCode,
      required String title,
      required String body,
      required Map<String, dynamic> payload,
      required String icon}) {
    flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: icon,
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true),
      ),
      payload: jsonEncode(payload),
    );
  }

  static showMessageNotification({
    required Map<String, dynamic> payload,
    required String icon,
    required NotificationEJson ejson,
  }) {
    flutterLocalNotificationsPlugin.show(
      int.parse(payload['notId']),
      payload['title'],
      payload['message'],
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: null,
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true),
      ),
      payload: jsonEncode(ejson.toJson()),
    );
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}
}
