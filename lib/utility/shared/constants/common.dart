import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonConstants {
  static const String test = 'test';
  static const num testNum = 1;
  static const double largeText = 40.0;
  static const double normalText = 22.0;
  static const double smallText = 16.0;

  static FontWeight light = FontWeight.w300;
  static FontWeight medium = FontWeight.w400;
  static FontWeight regular = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
}

double pxToDouble({required double px}) {
  return 0.08333333 * px;
}

String getRandomNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(10000000);
  int lngt = randomNumber.toString().length;
  String myNumber = randomNumber.toString().substring(0, lngt > 5 ? 5 : lngt);
  return myNumber;
}

bool isJsonString(value) {
  try {
    jsonDecode(value);
  } catch (e) {
    return false;
  }
  return true;
}

bool isList(value) {
  return value is List;
}

bool isNotNull(value) {
  return value != null;
}

class CustonDebounce {
  final int second;
  Timer? _timer;

  CustonDebounce({required this.second});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: second), action);
  }
}

Map<String, bool> checkDate(DateTime date) {
  DateTime now = DateTime.now();
  bool monthSame = date.month == now.month;
  bool yearSame = date.year == now.year;
  int daySame = now.day - date.day;
  bool weekSame = date.day >= now.day - 7 && now.day - 7 <= now.day;
  // Get.log('month ${now.month} -- ${date.month} == $monthSame and year $yearSame' );
  var obj = {
    'just': monthSame &&
        yearSame &&
        daySame == 0 &&
        now.hour == date.hour &&
        now.minute == date.minute,
    'yesterday': monthSame && yearSame && daySame == 1,
    'today': monthSame && yearSame && daySame == 0,
    'week': monthSame && yearSame && weekSame,
    'month': monthSame
  };

  return obj;
}

String parseDateTime(DateTime dateTime) {
  final format = DateFormat('HH:mm');
  final today = format.format(dateTime);
  final formatMonth = DateFormat('dd/MM/yy');
  final formatWeek = DateFormat('EEEE');

  // if (checkDate(dateTime)['just']!) return 'just_now'.tr;
  if (checkDate(dateTime)['today']!) return today;
  if (checkDate(dateTime)['yesterday']!) return 'yesterday'.tr;
  if (checkDate(dateTime)['week']!) return formatWeek.format(dateTime);

  return formatMonth.format(dateTime);
}

String parseDateToTime(DateTime time) {
  final format = DateFormat('HH:mm');
  final today = format.format(time);
  return today;
}

String parseDateToString(DateTime time) {
  final formatDate = DateFormat('dd MMM yyyy');
  final today = formatDate.format(time);
  return today;
}

int generateNumberFromString(String input) {
  var bytes = utf8.encode(input);
  var digest = sha256.convert(bytes);
  var digestAsHex = digest.toString();
  var number = BigInt.parse(digestAsHex, radix: 16);
  var mod = BigInt.from(pow(10, 6));
  var res = (number % mod).toInt();
  print('sha256 $res');
  return res;
}
