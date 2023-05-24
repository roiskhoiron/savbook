import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    hide Message;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/common.dart';
import '../storage_service.dart';

class NotificationHelper {
  static defaultVibration() {
    final vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    return vibrationPattern;
  }

  static Future<String?> base64encodedImage(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    // print('respon  ${response.body}');
    if (response.body.contains('<svg xmlns=')) return null;
    final String base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }

  Future<Uint8List> getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  Future<Uint8List> getImageFromURL(String imageUrl) async {
    var uri = Uri.https(imageUrl);
    var response = await http.get(uri);
    var imageBytes = response.bodyBytes;
    return imageBytes;
  }

  static Future<ByteArrayAndroidBitmap?>
      changeImageShapeToCircleAndReturnBase64(
          String title, String username) async {
    final createUrl = 'https://chat.gettalk.id/avatar/$username';
    final base = await base64encodedImage(createUrl);
    late ui.Image circularImage;
    if (base == null) {
      circularImage = await createInitialsImage(title);
    } else {
      // Decode base64 string to Uint8List
      Uint8List decodedImage = base64Decode(base);

      // Create an Image widget from Uint8List
      ui.Image image = await decodeImageFromList(decodedImage);

      // Create a circular clip
      PictureRecorder recorder = PictureRecorder();
      Canvas canvas = Canvas(recorder);
      canvas.clipPath(Path()
        ..addOval(Rect.fromCircle(
            center: Offset(image.width / 2, image.height / 2),
            radius: image.width / 2)));
      canvas.drawImage(image, Offset.zero, Paint());
      Picture picture = recorder.endRecording();

      // Encode Picture to Uint8List
      circularImage = await picture.toImage(image.width, image.height);
    }

    ByteData? byteData =
        await circularImage.toByteData(format: ImageByteFormat.png);
    Uint8List circularImageList = byteData!.buffer.asUint8List();

    // Encode Uint8List to base64 string
    String circularImageBase64 = base64Encode(circularImageList);

    final toAndroidBitmap =
        ByteArrayAndroidBitmap.fromBase64String(circularImageBase64);
    return toAndroidBitmap;
  }

  static Future<ui.Image> createInitialsImage(String name) async {
    // Split the name into first and last name
    var names = name.split(' ');
    var firstName = names[0];
    double size = 100.0;
    // Get the first letter of the first and last name
    var firstLetter = firstName.substring(0, 1);

    // Create a Canvas to draw the initials
    var pictureRecorder = PictureRecorder();
    var canvas = Canvas(pictureRecorder, Rect.fromLTRB(0.0, 0.0, size, size));
    canvas.drawCircle(
        Offset(size / 2, size / 2), 50.0, Paint()..color = Colors.blue);

    // Draw the first letter in the center of the canvas
    var firstLetterSpan = TextSpan(
        text: firstLetter,
        style: const TextStyle(fontSize: 50.0, color: Colors.white));
    var firstLetterPainter =
        TextPainter(text: firstLetterSpan, textDirection: TextDirection.ltr);
    firstLetterPainter.layout();
    firstLetterPainter.paint(
        canvas,
        Offset(50.0 - firstLetterPainter.width / 2.0,
            50.0 - firstLetterPainter.height / 2.0));

    // Create a Picture from the PictureRecorder
    var picture = pictureRecorder.endRecording();

    ui.Image circularImage = await picture.toImage(size.toInt(), size.toInt());
    return circularImage;
  }

  Future<Dio> _setupDio() async {
    final pref = await SharedPreferences.getInstance();
    String userId = pref.getString(StorageEnum.userId.name) ?? '';
    String token = pref.getString(StorageEnum.authToken.name) ?? '';
    final Dio dio = Dio();
    dio.options.baseUrl = 'https://chat.gettalk.id/api/v1';
    dio.options.headers = {
      'X-Auth-token': token,
      'X-User-token': token,
      'X-User-Id': userId,
    };
    final evaluator = DefaultRetryEvaluator(defaultRetryableStatuses);
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 2,
        retryDelays: const [Duration(minutes: 1), Duration(minutes: 1)],
        retryEvaluator: evaluator.evaluate,
      ),
    );
    return dio;
  }

  Future sendMessage(String rid, String message) async {
    var data = {};
    final dio = await _setupDio();
    var response = await dio.post('/chat.sendMessage', data: data);
    print('response send ${response.statusCode}');
    return response;
  }

  Future readMessages(String messageId) async {
    final dio = await _setupDio();
    var response =
        await dio.get('/chat.getMessageReadReceipts?messageId=$messageId');
    print('response read ${response.statusCode}');
    return response;
  }

  static int generateUniqueId(String title) {
    final nameHadTrim = title.toLowerCase().trim();
    final uniqueId = generateNumberFromString(nameHadTrim);
    return uniqueId;
  }
}
