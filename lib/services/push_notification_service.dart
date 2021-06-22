import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {
  static final messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print('Token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandlerdHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenHandler);

    // Local notifications
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    print("Background handler ${message.data}");

    _messageStream.add(message.notification?.body ?? 'Sin título');
  }

  static Future<void> _onMessageHandlerdHandler(RemoteMessage message) async {
    print("onMessage handler ${message.data}");

    _messageStream.add(message.notification?.body ?? 'Sin título');
  }

  static Future<void> _onOpenHandler(RemoteMessage message) async {
    print("onOpen handler ${message.data}");

    _messageStream.add(message.notification?.body ?? 'Sin título');
  }

  static closeStreams() {
    _messageStream.close();
  }
}
