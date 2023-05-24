import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'firebase_messaging_service.dart';
import 'notification_helper.dart';
import 'notification_models.dart';
import 'notification_storage.dart';

class NotificationUtils {
  static Future showRemoteNotification(NotificationData data) async {
    await addNotification(data);
    final ejson = NotificationEJson.fromJson(json.decode(data.ejson));

    var groupThis = ejson.rid;
    var uniqueId = NotificationHelper.generateUniqueId(data.title);
    // print('uniqid from $nameHadTrim = $uniqueId');
    // print('ridnya ini $groupThis');

    final list = await getMapNotifications();
    // print('showRemoteNotification after $list');

    final notificationsInGroup = list[data.title] ?? [];
    List<String> body = notificationsInGroup.map((e) {
      if (e.style == 'reply') {
        return 'You: ${e.message.toString()}';
        // return '<b>You</b>: ${e.message.toString()}';
      }
      return e.message.toString();
    }).toList();
    final summary =
        body.length == 1 ? 'new messages' : '${body.length} new messages';

    List<AndroidNotificationAction> action = [
      AndroidNotificationAction(TypePayload.reply.name, 'Reply',
          allowGeneratedReplies: true,
          inputs: [
            const AndroidNotificationActionInput(
                label: 'Reply', allowFreeFormInput: true)
          ]),
      AndroidNotificationAction(
        TypePayload.read.name,
        'Mark as Read',
      )
    ];

    final defaultStyle = InboxStyleInformation(body,
        summaryText: summary,
        htmlFormatContentTitle: true,
        htmlFormatTitle: true,
        htmlFormatLines: true,
        contentTitle: '<b>${ejson.senderName}</b>');

    final iconFromBase64 =
        await NotificationHelper.changeImageShapeToCircleAndReturnBase64(
            ejson.senderName, data.title);

    final AndroidNotificationDetails firstNotificationAndroidSpecifics =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      icon: 'splash',
      largeIcon: iconFromBase64,
      channelDescription: channel.description,
      importance: Importance.max,
      priority: Priority.max,
      groupKey: groupKey,
      channelShowBadge: true,
      number: body.length,
      vibrationPattern: NotificationHelper.defaultVibration(),
      actions: action,
      styleInformation: defaultStyle,
      tag: groupThis,
    );

    final NotificationDetails firstNotificationPlatformSpecifics =
        NotificationDetails(android: firstNotificationAndroidSpecifics);
    var success = await flutterLocalNotificationsPlugin.show(uniqueId,
        ejson.senderName, body.last, firstNotificationPlatformSpecifics,
        payload: jsonEncode(data));
    success = await groupNotification();
  }

  static Future<void> groupNotification() async {
    final list = await getMapNotifications();
    List<String> bodyGroup = list.entries.map((e) {
      final message = e.value.last.style == 'reply'
          ? 'You: ${e.value.last.message}'
          : e.value.last.message;
      final text = '<b>${e.key}</b>: $message';
      return text;
    }).toList();
    List<NotificationData> combinedList = list.values.expand((i) => i).toList();
    var summaryGroup =
        '${combinedList.length} new message from ${list.length} chats';

    final AndroidNotificationDetails secondNotificationAndroidSpecifics =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.low,
            priority: Priority.low,
            vibrationPattern: null,
            sound: null,
            groupKey: groupKey,
            setAsGroupSummary: true,
            category: AndroidNotificationCategory.message,
            styleInformation: InboxStyleInformation(bodyGroup,
                summaryText: summaryGroup,
                htmlFormatLines: true,
                htmlFormatSummaryText: true,
                htmlFormatContentTitle: true));
    final NotificationDetails secondNotificationPlatformSpecifics =
        NotificationDetails(android: secondNotificationAndroidSpecifics);
    return await flutterLocalNotificationsPlugin.show(
        0, '', '', secondNotificationPlatformSpecifics);
  }

  void showScheduleNotification(RemoteMessage message) async {
    final data = NotificationData.fromJson(message.data);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

    var scheduledNotificationDateTime =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1));
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    final ejson = NotificationEJson.fromJson(json.decode(data.ejson));

    var groupThis = ejson.rid;
    var uniqueId = NotificationHelper.generateUniqueId(data.title);
    // print('uniqid from $nameHadTrim = $uniqueId');
    // print('ridnya ini $groupThis');

    var list = await getMapNotifications();
    // print('showRemoteNotification after ${list.length} '
    //     '${list.toString()}');

    var notificationsInGroup = list[data.title] ?? [];

    List<String> body =
        notificationsInGroup.map((e) => e.message.toString()).toList();
    final summary =
        body.length == 1 ? data.message : '${body.length} new messages';

    List<AndroidNotificationAction> action = [
      AndroidNotificationAction(TypePayload.read.name, 'Mark as Read'),
      AndroidNotificationAction(TypePayload.reply.name, 'Reply',
          allowGeneratedReplies: true,
          // showsUserInterface: true, cancelNotification: true,
          inputs: [
            const AndroidNotificationActionInput(
                label: 'Reply', allowFreeFormInput: true)
          ])
    ];

    final AndroidNotificationDetails firstNotificationAndroidSpecifics =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.max,
      priority: Priority.high,
      groupKey: groupKey,
      ticker: 'test ticker',
      actions: action,
      styleInformation: InboxStyleInformation(body, contentTitle: data.title),
      tag: groupThis,
    );
    final NotificationDetails firstNotificationPlatformSpecifics =
        NotificationDetails(android: firstNotificationAndroidSpecifics);
    var success = await flutterLocalNotificationsPlugin.zonedSchedule(
        message.hashCode,
        data.title,
        data.message,
        scheduledNotificationDateTime,
        firstNotificationPlatformSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: jsonEncode(data.ejson));
  }

  void showDefaultLocalNotification(
      {required String title, required messages}) {
    int hashCode = Random().nextInt(1000);

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          channelDescription: channel.description,
          priority: Priority.max,
          importance: Importance.high,
          groupKey: groupKey),
    );

    flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      messages,
      notificationDetails,
    );
  }

  static Future notificationCall(NotificationData data) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
    var scheduledNotificationDateTime =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    final ejson = NotificationEJson.fromJson(json.decode(data.ejson));

    const tag = 'webrtc';
    final uniqueId = NotificationHelper.generateUniqueId(data.title) + 1;
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    final iconFromBase64 =
        await NotificationHelper.changeImageShapeToCircleAndReturnBase64(
            ejson.senderName, data.title);

    List<AndroidNotificationAction> action = [
      AndroidNotificationAction(TypePayload.reject.name, 'Reject',
          icon: DrawableResourceAndroidBitmap('hungup'),
          titleColor: Color.fromRGBO(241, 9, 9, 100)),
      AndroidNotificationAction(TypePayload.accept.name, 'Accept',
          icon: DrawableResourceAndroidBitmap('accept'),
          titleColor: Color.fromRGBO(20, 201, 60, 100))
    ];

    final AndroidNotificationDetails firstNotificationAndroidSpecifics =
        AndroidNotificationDetails(
      channelCall.id, channelCall.name,
      channelDescription: channelCall.description,
      priority: Priority.max,
      importance: Importance.max,
      largeIcon: iconFromBase64,
      sound: RawResourceAndroidNotificationSound('incoming_call_ringtone'),
      // colorized: true,
      // enableLights: true,
      color: Color.fromARGB(255, 255, 0, 0),
      // ledColor: Color.fromRGBO(54, 128, 239, 100),
      // ledOnMs: 1000,
      timeoutAfter: 60000,
      enableVibration: true,
      vibrationPattern: vibrationPattern,
      playSound: true,
      styleInformation: DefaultStyleInformation(true, true),
      category: AndroidNotificationCategory.missedCall,
      actions: action,
      fullScreenIntent: true,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        uniqueId,
        ejson.senderName,
        data.message,
        scheduledNotificationDateTime,
        NotificationDetails(android: firstNotificationAndroidSpecifics),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future cancelNotification(
      {required String title, int? id, required String rid}) async {
    var uniqueId = id ?? NotificationHelper.generateUniqueId(title);
    try {
      var list = await removeNotifications(title);
      if (list.isNotEmpty) {
        await flutterLocalNotificationsPlugin.cancel(uniqueId, tag: rid);
        await groupNotification();
      } else {
        await cancelAllNotification();
      }
    } catch (e) {
      print('errorr $e');
    }
  }

  static Future cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
