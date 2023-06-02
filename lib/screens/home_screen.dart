import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            
          },
          child: const Text("Play"),
        )
      ]),
    );
  }
}
