import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../storage_service.dart';
import 'notification_models.dart';

final String _key = StorageEnum.notification.name;

Future<SharedPreferences> getSharedPreference() async {
  final SharedPreferences instance = await SharedPreferences.getInstance();
  await instance.reload();
  return instance;
}

Future addNotification(NotificationData data) async {
  SharedPreferences pref = await getSharedPreference();
  List<String> items = pref.getStringList(_key) ?? [];
  print('get addNotification $items');
  items.add(json.encode(data.toJson()));
  return await pref.setStringList(_key, items);
}

Future clearAllNotifications() async {
  SharedPreferences pref = await getSharedPreference();
  return await pref.remove(_key);
}

Future<List<String>> getListNotification() async {
  SharedPreferences pref = await getSharedPreference();
  List<String> items = pref.getStringList(_key) ?? [];
  return items;
}

Future<Map<String, List<NotificationData>>> getMapNotifications() async {
  List<String> items = await getListNotification();
  Map<String, List<NotificationData>> groupedNotifications = {};
  for (var i in items) {
    NotificationData element = NotificationData.fromJson(json.decode(i));
    if (!groupedNotifications.containsKey(element.title)) {
      groupedNotifications[element.title] = [];
    }
    groupedNotifications[element.title]?.add(element);
  }
  return groupedNotifications;
}

Future<List<String>> removeNotifications(String username) async {
  print('masuk remove shared = $username');

  SharedPreferences pref = await getSharedPreference();
  List<String> items = pref.getStringList(_key) ?? [];
  print('sebelum remove ya ${items.length}');

  List<String> filter = [];
  for (var item in items) {
    final data = NotificationData.fromJson(json.decode(item));
    print('titel ${data.title} - $username');
    if (data.title != username) {
      filter.add(item);
    }
  }
  print('after ya ${filter.length} $filter');
  // final uniqueId = NotificationHelper.generateUniqueId(username);
  // if (filter.isEmpty) {
  //   await FlutterLocalNotificationsPlugin().cancel(uniqueId);
  //   // // return;
  //   // // await groupNotification();
  // } else {
  //   await NotificationUtils.cancelAllNotification();
  // }
  await pref.setStringList(_key, filter);
  return filter;

  // await NotificationUtils.cancelNotification(username, filter.isNotEmpty);
}

// class StorageNotification {
//   static final String _key = StorageEnum.notification.toString();
//
//   // static final StorageNotification _instance = StorageNotification._internal();
//   //
//   // factory StorageNotification() {
//   //   return _instance;
//   // }
//   //
//   // StorageNotification._internal();
//   static final StorageNotification _instance = StorageNotification._internal();
//   static SharedPreferences? _preferences;
//
//   factory StorageNotification() {
//     return _instance;
//   }
//
//   StorageNotification._internal();
//
//   Future<void> init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   Future<void> addNotification(NotificationData data) async {
//     // final pref = await SharedPreferences.getInstance();
//     List<String> items = _preferences?.getStringList(_key) ?? [];
//     items.add(json.encode(data.toJson()));
//     _preferences?.reload();
//     _preferences?.setStringList(_key, items);
//   }
//
//   Future<void> clearAllNotifications() async {
//     // final pref = await SharedPreferences.getInstance();
//     _preferences?.remove(_key);
//   }
//
//   Future<Map<String, List<NotificationData>>> getNotifications() async {
//     // final pref = await SharedPreferences.getInstance();
//     _preferences?.reload();
//     List<String> items = _preferences?.getStringList(_key) ?? [];
//     final list = items
//         .map((item) => NotificationData.fromJson(json.decode(item)))
//         .toList();
//     for (var item in items) {
//       print('getNotif ya $item');
//     }
//     Map<String, List<NotificationData>> groupedNotifications = {};
//
//     for (var item in list) {
//       if (!groupedNotifications.containsKey(item.title)) {
//         groupedNotifications[item.title] = [];
//       }
//       groupedNotifications[item.title]?.add(item);
//     }
//     return groupedNotifications;
//   }
//
//   Future<bool> removeNotifications(String username) async {
//     print('masuk remove shared = $username');
//     List<String> items = _preferences?.getStringList(_key) ?? [];
//     print('sebelum remove ya ${items.length}');
//
//     items.removeWhere((item) =>
//         NotificationData.fromJson(json.decode(item)).title == username);
//     print('after remove ya ${items.length}');
//     _preferences?.setStringList(_key, items);
//
//     print('getNotifications ${await getNotifications()}');
//     return true;
//   }
// }
// Future<void> loadFromPreferences() async {
// //   final prefs = await SharedPreferences.getInstance();
// //   final data = prefs.getStringList(_key);
// //   if (data != null) {
// //     if (data.isNotEmpty) {
// //       List<NotificationData> loadList  =
// //           data.map((e) => NotificationData.fromJson(json.decode(e))).toList();
// //
// //       print('loadPrefe ${loadList.length} - $loadList');
// //       _items.clear();
// //       _items.addAll(loadList);
// //       notifyListeners();
// //
// //     }
// //   }
// // }
// //
// // Future<void> saveToPreferences() async {
// //   final prefs = await SharedPreferences.getInstance();
// //   var list = _items.map((f) => json.encode(f)).toList();
// //   prefs.setStringList(_key, list);
// // }
// //
// // void createKeyValue(NotificationData value) async{
// //   print('createKeyValue ${value.title}');
// //   _items.add(value);
// //   saveToPreferences();
// //   print('hasilll ${_items}');
// //   notifyListeners();
// // }
// //
// // List<NotificationData>? readValue(String key) {
// //   return [];
// // }
// //
// // void updateValue(NotificationData value) {
// //   int index = items.indexOf(value);
// //   if (index >= 0) {
// //     _items[index] = value;
// //     saveToPreferences();
// //     notifyListeners();
// //   } else {
// //     createKeyValue(value);
// //   }
// // }
// //
// // // void updateValue(NotificationData newValue) {
// // //   if (_items.isNotEmpty) {
// // //     print('updateValue $key');
// // //     _items[key]!.add(newValue);
// // //     saveToPreferences();
// // //     notifyListeners();
// // //   } else {
// // //     createKeyValue(key, newValue);
// // //   }
// // // }
// //
// // void deleteKey(String title) {
// //   List<NotificationData> newList = [];
// //   _items.map((element) {
// //     NotificationEJson eJson =
// //         NotificationEJson.fromJson(json.decode(element.ejson));
// //     if (eJson.sender.username != title) {
// //       newList.add(element);
// //     }
// //   });
// //   _items = newList;
// //   saveToPreferences();
// //   notifyListeners();
// // }
// //
// // void deleteAll() {
// //   _items.clear();
// //   saveToPreferences();
// //   notifyListeners();
// // }
// }

// class StoreGlobalNotification {
//   final Map<String, List<NotificationData>> _myMap = {};
//
//   Map<String, List<NotificationData>> get myMap => _myMap;
//
//   void createKeyValue(String key, List<NotificationData> value) {
//     _myMap[key] = value;
//   }
//
//   List<NotificationData>? readValue(String key) {
//     return _myMap[key];
//   }
//
//   void updateValue(String key, List<NotificationData> newValue) {
//     // if (_myMap.containsKey(key)) {
//     //   var check = _myMap[key]!
//     //       .where((element) =>
//     //   element.ejson.messageId == newValue.first.ejson.messageId)
//     //       .toList();
//     //   if (check.isEmpty) _myMap[key]!.addAll(newValue);
//     // } else {
//     //   createKeyValue(key, newValue);
//     // }
//   }
//
//   void deleteKey(String key) {
//     _myMap.remove(key);
//   }
//
//   void deleteAll() {
//     _myMap.clear();
//   }
// }
