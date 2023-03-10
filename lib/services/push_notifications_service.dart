import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  // ignore: prefer_final_fields
  static StreamController<String> _messageStreamController =
      StreamController.broadcast();
  //  Getter estatico
  static Stream<String> get messageStreamController =>
      _messageStreamController.stream;

  static Future initializeApp() async {
    //  Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //  Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    FirebaseMessaging.onMessage.listen(_onMessageHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //  Local notifications
  }

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
