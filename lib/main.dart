import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundfinder/layout/Investor/login.dart';
import 'package:fundfinder/layout/Investor/sign_up/sign_up.dart';
import 'package:fundfinder/layout/startup/sign_up/sign_up1.dart';
import 'package:fundfinder/modules/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sign_Up(),
    );
  }
}
