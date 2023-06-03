import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:trivial_game/repo/game_repo.dart';

import '../widget/option.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    GameRepo gameRepo = context.watch<GameRepo>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text((gameRepo.currentQuestion + 1).toString()),
            ),
            Container(
              child: Text(
                  gameRepo.gameQuestions[gameRepo.currentQuestion].question),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: gameRepo.gameQuestions[gameRepo.currentQuestion]
                      .incorrectAnswers.length,
                  itemBuilder: (BuildContext, index) {
                    var pos = index + 1;
                    return InkWell(
                      onTap: () {
                        gameRepo.checkAnswer(gameRepo
                            .gameQuestions[gameRepo.currentQuestion]
                            .incorrectAnswers[index]);
                      },
                      child: Option(
                          text: "($pos)" +
                              gameRepo.gameQuestions[gameRepo.currentQuestion]
                                  .incorrectAnswers[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
