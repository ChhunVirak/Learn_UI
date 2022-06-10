import 'dart:math';

import 'package:change_language/modules/app_tour/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Apptour extends StatefulWidget {
  const Apptour({Key? key}) : super(key: key);

  @override
  State<Apptour> createState() => _ApptourState();
}

class _ApptourState extends State<Apptour> {
  int elapsed = 10;
  final controller = Get.put(ControllerCount());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Touring(
          //   duration: const Duration(milliseconds: 200),
          //   stepcolor: Colors.teal,
          //   backstepcolor: Colors.red[100],
          //   stepstyle: STEPSTYLE.increase,
          //   itemcount: images.length,
          //   itembuilder: (BuildContext context, int index) => Container(
          //     color: Colors.blue,
          //     padding: const EdgeInsets.all(20.0),
          //     child: Image.network(images[index]),
          //   ),
          //   onEnd: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const HomeScreen(),
          //       ),
          //     );
          //   },
          //   onSkip: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const HomeScreen(),
          //       ),
          //     );
          //   },
          // ),
          SafeArea(
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                "${controller.i.value}",
                key: ValueKey(elapsed),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff)),
              ),
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.increase();
          },
          child: const Icon(Icons.add)),
    );
  }
}
