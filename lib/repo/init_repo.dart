import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trivial_game/screens/init_screen.dart';

import '../database/db_helper.dart';
import '../screens/home_screen.dart';
import 'general_repo.dart';

class Initialize extends ChangeNotifier {
  int INSERTLEVEL = 0;
  //int _INSERTLEVEL get => INSERTLEVEL;
  Initialize() {
    DbHelper().initializedDB();
  }
  void initializeGame(BuildContext context) async {
    if (await DbHelper().checkQuestions() > 0) {
      GeneralRepo().navigateReplaceScreen(context, const HomeScreen());
    } else {
      GeneralRepo().navigateReplaceScreen(context, const InitScreen());
    }

    void inisertQuestuions() {
      List questions = jsonDecode("assets/json/questions.json");
      print(questions);
    }
  }
}
