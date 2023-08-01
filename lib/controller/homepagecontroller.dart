import 'package:get/get.dart';
import 'package:quizapp/model/quizmodel.dart';
import 'package:quizapp/view/result.dart';

class HomePageCntroller extends GetxController {
  List<QuizModel> quiz = quistions;
  int inde = 0;
  int result = 0;
  bool color = false;
  late String resulttext;

  changeinde(index) {
    quiz[inde].answers[index] == quiz[inde].correct ? correct() : go();

    update();
  }

  correct() async {
    result += 10;
    color = true;
    await Future.delayed(const Duration(milliseconds: 600));
    update();
    inde != 4
        ? inde++
        : Get.off(() => Result(
              result: result,
            ));
    color = false;
    update();
  }

  go() {
    inde != 4
        ? inde++
        : Get.off(() => Result(
              result: result,
            ));
  }

  String gettext() {
    if (result >= 40) {
      resulttext = "excellent";
    } else if (result <= 20) {
      resulttext = "Very bad";
    } else {
      resulttext = "good";
    }
    return resulttext;
  }
}

List<QuizModel> quistions = [
  QuizModel(
    quistion: "What is the number of letters in the alphabet?",
    answers: ["26", "25", "27", "28"],
    correct: "26",
  ),
  QuizModel(
    quistion: "What is the capital of France?",
    answers: ["Paris", "London", "Rome", "Madrid"],
    correct: "Paris",
  ),
  QuizModel(
    quistion: "What is the color of the sky on a clear day?",
    answers: ["Blue", "Green", "Red", "Yellow"],
    correct: "Blue",
  ),
  QuizModel(
    quistion: "What is the name of the animal that lays eggs?",
    answers: ["Chicken", "Dog", "Cat", "Horse"],
    correct: "Chicken",
  ),
  QuizModel(
    quistion: "What is the name of the fruit that is red and has a long stem?",
    answers: ["Apple", "Banana", "Grapes", "Orange"],
    correct: "Apple",
  ),
];
