import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigici_task/InputSc.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({super.key});

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(InputSc());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Grid Search App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
