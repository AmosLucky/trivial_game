import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivial_game/repo/game_repo.dart';
import 'package:trivial_game/repo/general_repo.dart';
import 'package:trivial_game/screens/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GameRepo gameRepo = context.watch<GameRepo>();
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            gameRepo.fetchQuestions();
            GeneralRepo().navigateReplaceScreen(context, GameScreen());
          },
          child: const Text("Play"),
        )
      ]),
    );
  }
}
