import 'package:flutter/material.dart';
import 'package:push_notifications/pages/home_page.dart';
import 'package:push_notifications/pages/message_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push notifications demo',
      home: HomePage(),
      routes: {
        'home': (_) => HomePage(),
        'message': (_) => MessagePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
