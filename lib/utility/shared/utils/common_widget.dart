import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonWidget {
  static AppBar appBar(
      BuildContext context, String title, IconData? backIcon, Color color,
      {void Function()? callback}) {
    return AppBar(
      leading: backIcon == null
          ? null
          : IconButton(
              icon: Icon(backIcon, color: color),
              onPressed: () {
                if (callback != null) {
                  callback();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: color, fontFamily: 'Rubik'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static void actionBarLigth() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white));
  }

  static void actionBarLigthBlue() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF52C4C5)));
  }

  static void actionBarDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black));
  }

  static void actionBarTransparant() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ));
  }

  static void navigationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light));
  }

  /*static void enterFullScreen() async {
    await FullScreen.enterFullScreen(FullScreenMode.LEANBACK);
  }

  static void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }*/

  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static void toast(String error,
      {Color backgroundColor = Colors.white}) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: backgroundColor,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static void shortToast(String msg) async {
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static List<TextSpan> getSearchMatches(
      {required String text,
      required String query,
      required TextStyle? style}) {
    List<TextSpan> matches = [];
    List<String> splitText = text.split(query);
    int startIndex = 0;
    RegExp regex = RegExp(query, caseSensitive: false);
    Match? match = regex.firstMatch(text);

    while (match != null) {
      if (match.start > startIndex) {
        matches.add(TextSpan(text: text.substring(startIndex, match.start)));
      }
      matches.add(TextSpan(
          text: match.group(0),
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          )));
      startIndex = match.end;
      match = regex.firstMatch(text.substring(startIndex));
    }

    if (startIndex < text.length) {
      matches.add(TextSpan(text: text.substring(startIndex)));
    }

    return matches;
  }
}
