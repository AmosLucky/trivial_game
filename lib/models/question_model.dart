

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
    int id;
    String category;
    String type;
    String difficulty;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    QuestionModel({
        required this.id,
        required this.category,
        required this.type,
        required this.difficulty,
        required this.question,
        required this.correctAnswer,
        required this.incorrectAnswers,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
    };
}
