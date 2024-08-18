import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_live_score_project/ui/entities/push_notification_service.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await PushNotificationService.instance.initialize();
  runApp(const LiveScore());
}
