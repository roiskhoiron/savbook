import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await initNotification();
  showDefaultNotification(message);
  print('Handling a background message ${message.messageId}');
}

final BehaviorSubject<String> storeNotificationClick = BehaviorSubject();
final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
const bool isLocalNotificationInit = false;

const channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);
const String groupKey = 'com.android.example.WORK_EMAIL';
Future<void> initNotification() async {
  await Firebase.initializeApp();
  if (isLocalNotificationInit) return;
  const initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int? id, String? title, String? body, String? payload) async {});

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await _localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
  //     await _localNotificationsPlugin.getNotificationAppLaunchDetails();
  // final didNotificationLaunchApp =
  //     notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
  // if (didNotificationLaunchApp) {
  //   final resNotification = notificationAppLaunchDetails?.notificationResponse;
  //   if (resNotification != null) onSelectNotification(resNotification);
  // } else {
  // }


  await _localNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
      onDidReceiveBackgroundNotificationResponse: onSelectNotification);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void showDefaultNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  print('iniLoh ejsonnya ${message.toMap()}');
  // if (message.data.isNotEmpty){
  //   print('iniLoh ejsonnya ${message.data['ejson']}');
  // final msg = NotificationEJson.fromJson(jsonDecode(message.data['ejson']));
  //   LocalNotification.showMessageNotification(
  //       payload: message.data, icon: 'app_icon', ejson: msg);

  BigTextStyleInformation bigTextStyleInformation =
  BigTextStyleInformation(
    message.data['message'],
    htmlFormatBigText: true,
    contentTitle: message.data['title'],
    htmlFormatContentTitle: true,
    summaryText:  message.data['title'],
    htmlFormatSummaryText: true,
  );
  _localNotificationsPlugin.show(
      notification.hashCode,
      message.data['title'],
      message.data['message'],
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              ongoing: false,
              icon: 'app_icon',
              groupKey: groupKey,
              setAsGroupSummary: true)),
      payload: jsonEncode(message.data));
  // }
}

void onSelectNotification(NotificationResponse notificationResponse) {
  if (notificationResponse.payload != null) {
    if (notificationResponse.payload!.isEmpty) return;
    String payload = notificationResponse.payload!;
    print("payload $payload");
    storeNotificationClick.add(payload);

    // Navigator.
    //   Navigator.of(navigatorKey.currentContext!).push(
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               SomethingScreen(id: payloadData["id"],)));
  }
}
// late AndroidNotificationChannel channel;
//
// bool isFlutterLocalNotificationsInitialized = false;
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// Future<void> setupFlutterNotifications() async {
//   await Firebase.initializeApp();
//   if (isFlutterLocalNotificationsInitialized) {
//     return;
//   }
//   channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.max,
//   );
//   const initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');
//
//   final initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification:
//           (int? id, String? title, String? body, String? payload) async {});
//
//   var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//       await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//   final didNotificationLaunchApp =
//       notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
//
//   if (didNotificationLaunchApp) {
//     final resNotification = notificationAppLaunchDetails?.notificationResponse;
//     if (resNotification != null) onSelectNotification(resNotification);
//   } else {
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onSelectNotification,
//         onDidReceiveBackgroundNotificationResponse: onSelectNotification);
//   }
//
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   isFlutterLocalNotificationsInitialized = true;
// }
//
// void onSelectNotification(NotificationResponse notificationResponse) {
//   if (notificationResponse.payload != null) {
//     var payloadData = jsonDecode(notificationResponse.payload!);
//     print("payload $payloadData");
//
//     // Navigator.
//     //   Navigator.of(navigatorKey.currentContext!).push(
//     //       MaterialPageRoute(
//     //           builder: (context) =>
//     //               SomethingScreen(id: payloadData["id"],)));
//   }
// }
//
// void showFlutterNotification(RemoteMessage message) {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   print('iniLoh ejsonnya ${message.toMap()}');
//   // if (message.data.isNotEmpty){
//   //   print('iniLoh ejsonnya ${message.data['ejson']}');
//   // final msg = NotificationEJson.fromJson(jsonDecode(message.data['ejson']));
//   //   LocalNotification.showMessageNotification(
//   //       payload: message.data, icon: 'app_icon', ejson: msg);
//
//   flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       message.data['title'],
//       message.data['message'],
//       NotificationDetails(
//           android: AndroidNotificationDetails(channel.id, channel.name,
//               channelDescription: channel.description,
//               ongoing: false,
//               icon: 'app_icon',
//               setAsGroupSummary: true)),
//       payload: jsonEncode(message.data));
//   // }
// }

NotificationEJson eJsonFromJson(String str) =>
    NotificationEJson.fromJson(json.decode(str));

class NotificationEJson {
  NotificationEJson({
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

  factory NotificationEJson.fromJson(Map<String, dynamic> json) =>
      NotificationEJson(
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
