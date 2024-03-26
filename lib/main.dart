import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maps_notifications/notifications/test_notification.dart';
import 'notifications/local_notification_service.dart';
import 'notifications/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    // Firebase.initializeApp(),
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestNotification(),
    );
  }
}


