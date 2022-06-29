import 'package:change_language/modules/foodpanda/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPandaHome extends StatefulWidget {
  const FoodPandaHome({Key? key}) : super(key: key);

  @override
  State<FoodPandaHome> createState() => _FoodPandaHomeState();
}

class _FoodPandaHomeState extends State<FoodPandaHome> {
  final foodcontroller = Get.put(FoodController());

  @override
  void initState() {
    foodcontroller.getListPizza();
    super.initState();
  }

  bool seemore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => foodcontroller.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: foodcontroller.listPizza
                          .map(
                            (e) => SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  Image.network(
                                    e.image!,
                                    height: 20,
                                  ),
                                  Text('${e.name}'),
                                  Text('${e.price}\$'),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    // GridView.builder(gridDelegate: ,
                    //   padding: EdgeInsets.zero,
                    //   itemCount: seemore ? foodcontroller.listPizza.length : 5,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Card(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(20),
                    //         child: Row(
                    //           children: [
                    //             Image.network(
                    //               foodcontroller.listPizza[index].image!,
                    //               height: 20,
                    //             ),
                    //             Text(
                    //                 '   ${foodcontroller.listPizza[index].name}   '),
                    //             const Spacer(),
                    //             Text(
                    //                 '${foodcontroller.listPizza[index].price}\$'),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    ElevatedButton(
                        onPressed: () {
                          seemore = true;
                          // seemore = !seemore;
                          setState(() {});
                        },
                        child: const Text('See More'))
                  ],
                ),
        ),
      ),
    );
  }
}
