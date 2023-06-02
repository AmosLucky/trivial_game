import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivial_game/screens/init_screen.dart';

import '../database/db_helper.dart';
import '../screens/home_screen.dart';
import 'general_repo.dart';

class Initialize extends ChangeNotifier {
  double _insertLevel = 0;
  double get insertLevel => _insertLevel;
  Initialize() {
    DbHelper().initializedDB();
  }
  void inisertQuestuions(BuildContext context) async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    List questions = await json.decode(response);
    // List questions = jsonDecode("assets/json/questions.json");
    print(questions);
    for (int i = 0; i < questions.length; i++) {
      DbHelper().insertQuestions(convertTOJson(questions[i]));

      _insertLevel = (i / 15);

      notifyListeners();

      print(insertLevel);
    }
    initializeGame(context);
  }

  void initializeGame(BuildContext context) async {
    int i = await DbHelper().checkQuestions();
    if (i > 0) {
      // ignore: use_build_context_synchronously
      GeneralRepo().navigateReplaceScreen(context, const HomeScreen());
    } else {
      // ignore: use_build_context_synchronously
      GeneralRepo().navigateReplaceScreen(context, const InitScreen());
      // ignore: use_build_context_synchronously
      inisertQuestuions(context);
    }
  }

  Map<String, dynamic> convertTOJson(Map<String, dynamic> data) {
    var arrayToJson = json.encode(data['incorrect_answers']);
    data['incorrect_answers'] = arrayToJson;
    return data;
  }

  clear() {
    _insertLevel = 0;
    notifyListeners();
  }
}
