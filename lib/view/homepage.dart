import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/homepagecontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomePageCntroller controller = Get.put(HomePageCntroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<HomePageCntroller>(builder: (controller) {
              return Column(
                children: [
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(10),
                          child: Text(controller.quiz[controller.inde].quistion,
                              style: const TextStyle(fontSize: 20)))),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 6,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minWidth: 200,
                            color: controller.color == true &&
                                    controller.quiz[controller.inde]
                                            .answers[index] ==
                                        controller.quiz[controller.inde].correct
                                ? Colors.green
                                : Colors.blue,
                            onPressed: () {
                              controller.changeinde(index);
                            },
                            child: Text(
                              controller.quiz[controller.inde].answers[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                ],
              );
            })));
  }
}
