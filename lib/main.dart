import 'package:cartze/views/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cartze',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(
      seedColor:Colors.orange,
      brightness:  Brightness.light,)),
      home: MySplashPage(),
    );
      }
}