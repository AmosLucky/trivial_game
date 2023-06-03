import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trivial_game/models/question_model.dart';

class DbHelper {
  String databaseName = "trivial_chase.db";
  String questionTable = "questions";
  int DBVersion = 1;
  DatabaseHelper() {
    initializedDB();
  }

  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, databaseName),
      version: DBVersion,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE " +
              questionTable +
              "(id INTEGER PRIMARY KEY , category Text, type Text, difficulty Text, question Text, correct_answer Text,incorrect_answers Text)",
        );
      },
    );
  }

  Future<int> insertQuestions(Map<String, dynamic> row) async {
    int result = 0;
    final Database db = await initializedDB();
    result = await db.insert(questionTable, row);
    return result;
  }

  Future<List<Map<String, dynamic>>> selectAllQuestions() async {
    final Database db = await initializedDB();
    var res = await db.rawQuery("SELECT * FROM " + questionTable);
    if (res.length > 0) {
      return res;
    } else {
      return [];
    }
  }

  Future<int> checkQuestions() async {
    final Database db = await initializedDB();
    var res = await db.rawQuery("SELECT * FROM " + questionTable);
    return res.length;
  }

  Future<List<Map<String, dynamic>>> selectNumber(int id) async {
    final Database db = await initializedDB();
    var res = await db
        .rawQuery("SELECT * FROM " + questionTable + " where id = ${id}");
    if (res.length > 0) {
      return res;
    } else {
      return [];
    }
  }

  Future<int> update(Map<String, dynamic> row, id) async {
    final Database db = await initializedDB();

    return await db
        .update(questionTable, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final Database db = await initializedDB();

    return await db.delete(questionTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<QuestionModel>> selectGameQuestions() async {
    List<QuestionModel> questions = [];
    for (int i = 1; i < 16; i++) {
      var index = random(i, (i * 100));
      final Database db = await initializedDB();
      var res = await db
          .rawQuery("SELECT * FROM " + questionTable + " where id = ${index}");
      var converted = convertTOArray(res[0]);
      QuestionModel questionModel = QuestionModel.fromJson(converted);
      questionModel.incorrectAnswers
          .insert(random(0, 3), converted['correct_answer'] + "-");
      questions.add(questionModel);
    }
    return questions;
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  Map<String, dynamic> convertTOArray(Map<String, dynamic> data) {
    data = Map.of(data);
    var arrayToJson = jsonDecode(data['incorrect_answers']);

    data['incorrect_answers'] = arrayToJson;
    return data;
  }
}
