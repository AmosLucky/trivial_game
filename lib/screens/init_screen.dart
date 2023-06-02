import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivial_game/repo/init_repo.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    //Initialize().inisertQuestuions();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Initialize initialize = context.watch<Initialize>();
    //initialize. inisertQuestuions();

    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(initialize.insertLevel.toString())),
          MaterialButton(
              onPressed: () {
                initialize.clear();
              },
              child: Text("ooo"))
        ],
      )),
    );
  }
}
