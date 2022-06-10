import 'package:change_language/modules/foodpanda/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPandaHome extends StatefulWidget {
  const FoodPandaHome({Key? key}) : super(key: key);

  @override
  State<FoodPandaHome> createState() => _FoodPandaHomeState();
}

class _FoodPandaHomeState extends State<FoodPandaHome> {
  final listNumber = [1, 2, 3, 45, 5453, 9843857, 837437, 89437];
  final foodcontroller = Get.put(FoodController());
  bool isshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isshow
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: double.infinity,
                    height: 70,
                    color: Colors.pink[600],
                    alignment: Alignment.center,
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : const SizedBox(),
            NotificationListener(
              onNotification: (ScrollNotification scroll) {
                if (scroll.metrics.pixels > 50) {
                  setState(() {
                    isshow = false;
                  });
                }

                return false;
              },
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.network(
                              foodcontroller.a.img,
                              height: 20,
                            ),
                            Text('   ${foodcontroller.a.title}   '),
                            Text('${foodcontroller.a.desc}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
