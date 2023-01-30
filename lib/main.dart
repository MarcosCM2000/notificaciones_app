import 'package:flutter/material.dart';

import 'package:notificaciones_app/screens/screens.dart';
import 'package:notificaciones_app/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ((_) => const HomeScreen()),
        'message': ((_) => const MessageScreen())
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
