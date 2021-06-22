import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String arguments =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text(arguments),
      ),
    );
  }
}
