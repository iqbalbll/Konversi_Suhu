import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'provider/login.provider.dart';
import 'provider/suhu.provider.dart'; // tambahkan ini

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => TemperatureController()), // tambahkan ini
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
