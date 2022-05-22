import 'package:change_language/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedListt extends StatelessWidget {
  const AnimatedListt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> _key = GlobalKey();
    final cont = Get.put(BookController());
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Draggable(
              feedback: Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          DragTarget(builder: (context, list1, list2) {
            return Container();
          })
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _key.currentState!
                  .insertItem(0, duration: const Duration(seconds: 1));
              // cont.myList.add(1);
              cont.myList.refresh();
              cont.update();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              _key.currentState!
                  .insertItem(0, duration: const Duration(seconds: 1));
              cont.myList.add(1);
              cont.myList.refresh();
              cont.update();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
