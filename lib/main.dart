import 'package:crabcheck/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:crabcheck/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
      theme: ThemeData(
          fontFamily: 'Poppins', scaffoldBackgroundColor: backgroundColor),
    );
  }
}
