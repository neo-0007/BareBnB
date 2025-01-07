import 'package:app/features/auth/views/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bare BnB',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}