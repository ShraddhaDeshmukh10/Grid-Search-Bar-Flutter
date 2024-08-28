import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigici_task/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobigic Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashSc(),
      debugShowCheckedModeBanner: false,
    );
  }
}
