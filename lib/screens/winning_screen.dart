import 'package:flutter/material.dart';
import 'package:trivial_game/repo/general_repo.dart';
import 'package:trivial_game/screens/home_screen.dart';

class WinninScreen extends StatefulWidget {
  const WinninScreen({super.key});

  @override
  State<WinninScreen> createState() => _WinninScreenState();
}

class _WinninScreenState extends State<WinninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("Winner")),
          MaterialButton(
            onPressed: () {
              GeneralRepo().navigateReplaceScreen2(HomeScreen());
            },
            child: Text("Home"),
          )
        ],
      ),
    );
  }
}
