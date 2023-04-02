import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';

class FirebaseApi {
  static Future getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(token)
        .set({'token': token});

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
  }

  static Future sendPushNotification() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      final body = {
        "to": token,
        "notification": {
          "title": "",
          "body": "",
          "android_channel_id": "siqaretdenazadol",
        },
        "time_to_live": 60,
        "data": {"some_data": "User ID: $token"},
      };
      await post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'key=AAAAp7Agib8:APA91bHRyI_5OY0Y-GsdSWPnMb23nKc8PSVS0NpVfZz791mIoLUi38C9P1YdHfB1jBlMTIhWPM_YMvZ6_0QKjPmfb811CWkJDN89cVqWLgvkDSiaARgsG3kcr3YtRvtfPG8_C936S_2S',
        },
        body: jsonEncode(body),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
