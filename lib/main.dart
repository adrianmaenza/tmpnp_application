import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/auth/login_screen.dart';
import 'package:tmpnp_application/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TM Pick and Pay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(primaryColor)),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Home Page'),
    );
  }
}
