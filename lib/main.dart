import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:indi_tergit/firebase_options.dart';
import 'package:indi_tergit/screen/bottom_bar.dart';
import 'package:indi_tergit/utils/styles.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('box');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  notificationChannel();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}

Future notificationChannel() async {
  await FlutterNotificationChannel.registerNotificationChannel(
    id: 'siqaretdenazadol',
    name: 'Siqaretden Azad Ol',
    description: 'Message Notification',
    importance: NotificationImportance.IMPORTANCE_HIGH,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Styles.themeColor),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('az', ''),
      ],
      home: const BottomBar(),
    );
  }
}
