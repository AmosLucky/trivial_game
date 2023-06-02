import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_game/constatnts/app_name.dart';
import 'package:trivial_game/repo/init_repo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Initialize initialize = Initialize();
      initialize.initializeGame(context);
      print("object");
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Center(
            child: Text(appName),
          )),
    );
  }
}
