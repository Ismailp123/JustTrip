import 'package:flutter/material.dart';
import 'package:justtrip/Screens/loginScreen.dart';
import 'package:justtrip/Screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Trip',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity

      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

