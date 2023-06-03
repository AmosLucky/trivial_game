import 'package:flutter/foundation.dart';
import 'package:trivial_game/database/db_helper.dart';
import 'package:trivial_game/models/question_model.dart';
import 'package:trivial_game/repo/general_repo.dart';

import '../screens/winning_screen.dart';

class GameRepo extends ChangeNotifier {
  List<QuestionModel> _gameQuestions = [];
  List<QuestionModel> get gameQuestions => _gameQuestions;

  int _currentQuestion = 0;
  int get currentQuestion => _currentQuestion;

  fetchQuestions() async {
    //print("_gameQuestions");
    DbHelper dbHelper = DbHelper();
    _gameQuestions = await dbHelper.selectGameQuestions();
    print(_gameQuestions);
    _currentQuestion = 0;
    notifyListeners();
  }

  checkAnswer(String data) {
    if (data.replaceAll("-", "") ==
        (gameQuestions[currentQuestion].correctAnswer)) {
      print("correct");
      _currentQuestion = currentQuestion + 1;
      notifyListeners();
      if (currentQuestion >= 14) {
        GeneralRepo().navigateReplaceScreen2(WinninScreen());
      }
      print("correct");
    } else {
      print("failed");
    }
  }
}
