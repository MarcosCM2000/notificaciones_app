import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    //  Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    //  Local notifications
  }
}
