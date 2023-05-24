import 'dart:convert';

// import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import 'notification_helper.dart';
import 'notification_models.dart';
import 'notification_utils.dart';

const String groupKey = 'chat.callink.id';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
  final data = NotificationData.fromJson(message.data);
  print('Handling a background message ${message.toMap()}');
  if (data.message == 'Started Voice Call' ||
      data.message == 'Started Video Call') {
    await NotificationUtils.notificationCall(data);
    return;
  } else {
    await NotificationUtils.showRemoteNotification(data);
    return;
  }
}

final BehaviorSubject<String> storeNotificationClick = BehaviorSubject();
final localNotificationsPlugin = FlutterLocalNotificationsPlugin();
const bool isLocalNotificationInit = false;

bool isFlutterLocalNotificationsInitialized = false;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);
const channelCall = AndroidNotificationChannel(
  'call', // id
  'Call Channel', // title
  description: 'Channel for use incoming call', // description
  importance: Importance.max,
);
const channelGroup = AndroidNotificationChannelGroup(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
);

AndroidFlutterLocalNotificationsPlugin?
    _androidFlutterLocalNotificationsPlugin =
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

Future<void> setupFlutterNotifications() async {
  await Firebase.initializeApp();

  // FirebaseCrashlytics.instance.crash();
  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  /// Catch errors that happen outside of the Flutter context,
  // Isolate.current.addErrorListener(
  //   RawReceivePort((List<dynamic> pair) async {
  //     final List<dynamic> errorAndStacktrace = pair;
  //     await FirebaseCrashlytics.instance.recordError(
  //       errorAndStacktrace.first,
  //       errorAndStacktrace.last as StackTrace,
  //     );
  //   }).sendPort,
  // );

  if (isFlutterLocalNotificationsInitialized) return;

  const initializationSettingsAndroid = AndroidInitializationSettings('splash');

  final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int? id, String? title, String? body, String? payload) async {});

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await _androidFlutterLocalNotificationsPlugin
      ?.createNotificationChannelGroup(channelGroup);
  await _androidFlutterLocalNotificationsPlugin
      ?.createNotificationChannel(channel);

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  final didNotificationLaunchApp =
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  if (didNotificationLaunchApp) {
    final resNotification = notificationAppLaunchDetails?.notificationResponse;
    if (resNotification != null) onReceiveBackgroundResponse(resNotification);
  } else {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onReceiveResponse,
      onDidReceiveBackgroundNotificationResponse: onReceiveBackgroundResponse,
    );
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

///  🅰 callback A:
void onReceiveResponse(NotificationResponse notificationResponse) async {
  // final payload = notificationResponse.payload;
  print('notificationResponse: $notificationResponse');
  // if (notificationResponse.payload!.isEmpty) return;

  if (notificationResponse.payload!.isEmpty) return;
  String payload = notificationResponse.payload!;
  // print("notificationResponse payload $payload");

  switch (notificationResponse.notificationResponseType) {
    case NotificationResponseType.selectedNotification:
      if (notificationResponse.payload != null) {
        if (notificationResponse.payload!.isEmpty) return;
        // String payload = notificationResponse.payload!;
        // print("payload $payload");
        storeNotificationClick.add(payload);
      }
      return;
    case NotificationResponseType.selectedNotificationAction:
      print('payload selectedNotificationAction $payload');
      break;
  }
}

/// 🅱 callback B:
/// Functions passed to the [onDidReceiveBackgroundNotificationResponse] callback need to be
/// annotated with the @pragma('vm:entry-point') annotation to ensure they are not stripped out by the Dart compiler.
@pragma('vm:entry-point')
void onReceiveBackgroundResponse(
    NotificationResponse notificationResponse) async {
  // final payload = notificationResponse.payload;
  print('Background Notification payload: $notificationResponse');
  // print("payload acttion ${notificationResponse.actionId} "
  //     "${notificationResponse.input} "
  //     "${notificationResponse.notificationResponseType} "
  //     "${notificationResponse.id} "
  //     "${notificationResponse.payload} ");

  if (notificationResponse.payload!.isEmpty) return;
  String payload = notificationResponse.payload!;
  // print("payload $payload");

  switch (notificationResponse.notificationResponseType) {
    case NotificationResponseType.selectedNotification:
      if (notificationResponse.payload != null) {
        if (notificationResponse.payload!.isEmpty) return;
        String payload = notificationResponse.payload!;
        // print("payload $payload");
        storeNotificationClick.add(payload);
      }
      return;
    case NotificationResponseType.selectedNotificationAction:
      var data = NotificationData.fromJson(jsonDecode(payload));
      final ejson = NotificationEJson.fromJson(json.decode(data.ejson));

      if (notificationResponse.actionId == TypePayload.reply.name) {
        data.message = notificationResponse.input!;
        data.style = 'reply';

        await NotificationHelper()
            .sendMessage(ejson.rid, notificationResponse.input!);
        await NotificationUtils.showRemoteNotification(data);
        // print('selsai replay');
        return;
      }

      if (notificationResponse.actionId == TypePayload.read.name) {
        await NotificationHelper().readMessages(ejson.messageId);
        await NotificationUtils.cancelNotification(
            title: data.title, id: notificationResponse.id!, rid: ejson.rid);
        return;
      }
  }
}
