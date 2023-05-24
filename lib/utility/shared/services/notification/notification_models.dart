import 'dart:convert';

String notificationDataToJson(NotificationData? data) =>
    json.encode(data!.toJson());

class NotificationData {
  NotificationData({
    required this.image,
    required this.summaryText,
    required this.soundname,
    required this.style,
    required this.notId,
    required this.ejson,
    required this.title,
    required this.message,
    required this.msgcnt,
  });

  String image;
  String summaryText;
  String soundname;
  String style;
  String notId;
  String ejson;
  String title;
  String message;
  String msgcnt;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        image: json['image'],
        summaryText: json['summaryText'],
        soundname: json['soundname'],
        style: json['style'],
        notId: json['notId'],
        ejson: json['ejson'].toString(),
        title: json['title'],
        message: json['message'],
        msgcnt: json['msgcnt'],
      );

  Map<String, String> toJson() => {
        'image': image,
        'summaryText': summaryText,
        'soundname': soundname,
        'style': style,
        'notId': notId,
        'ejson': ejson,
        'title': title,
        'message': message,
        'msgcnt': msgcnt,
      };
}

NotificationEJson eJsonFromJson(String str) =>
    NotificationEJson.fromJson(json.decode(str));

class NotificationEJson {
  NotificationEJson({
    required this.host,
    required this.rid,
    required this.sender,
    required this.senderName,
    required this.type,
    required this.messageId,
  });

  String host;
  String rid;
  Sender sender;
  String senderName;
  String type;
  String messageId;

  factory NotificationEJson.fromJson(Map<String, dynamic> json) =>
      NotificationEJson(
        host: json['host'],
        rid: json['rid'],
        sender: Sender.fromJson(json['sender']),
        senderName: json['senderName'],
        type: json['type'],
        messageId: json['messageId'],
      );

  Map<String, String> toJson() => {
        'host': host,
        'rid': rid,
        'sender': sender.toJson().toString(),
        'senderName': senderName,
        'type': type,
        'messageId': messageId,
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
        id: json['_id'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
      };
}

enum TypePayload { reply, read, reject, accept ,click }
