import 'package:flutter/material.dart';

import 'package:push_notifications/pages/home_page.dart';
import 'package:push_notifications/pages/message_page.dart';
import 'package:push_notifications/services/push_notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messagesStream.listen((message) {
      print('Mensaje: $message');
      if (messengerKey.currentContext == null ||
          navigatorKey.currentContext == null) return;

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState!.showSnackBar(snackBar);
      navigatorKey.currentState!.pushNamed('message', arguments: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push notifications demo',
      home: HomePage(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home': (_) => HomePage(),
        'message': (_) => MessagePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
