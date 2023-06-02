import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("data"))],
      )),
    );
  }
}
