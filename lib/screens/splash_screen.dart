import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_game/constatnts/app_name.dart';
import 'package:trivial_game/database/db_helper.dart';
import 'package:trivial_game/repo/general_repo.dart';
import 'package:trivial_game/repo/init_repo.dart';
import 'package:trivial_game/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Initialize().initializeGame(context);
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
