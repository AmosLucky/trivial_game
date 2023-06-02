import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void inisertQuestuions() async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    List questions = await json.decode(response);
    // List questions = jsonDecode("assets/json/questions.json");
    print(questions);
  }

  void initializeGame(BuildContext context) async {
    if (await DbHelper().checkQuestions() > 0) {
      GeneralRepo().navigateReplaceScreen(context, const HomeScreen());
    } else {
      inisertQuestuions();
      GeneralRepo().navigateReplaceScreen(context, const InitScreen());
    }
  }
}
