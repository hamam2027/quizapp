// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizapp/controller/homepagecontroller.dart';
import 'package:quizapp/view/homepage.dart';

class Result extends StatelessWidget {
  HomePageCntroller controller = Get.find();
  int result;

  Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.gettext();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.resulttext,
              style: const TextStyle(fontSize: 40, color: Colors.blue),
            ),
            const Text(
              "Score",
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            Text(
              result.toString(),
              style: const TextStyle(fontSize: 40, color: Colors.black),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                controller.inde = 0;
                controller.result = 0;

                controller.update();
                Get.off(() => HomePage());
              },
              child: const Text(
                "restart",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
