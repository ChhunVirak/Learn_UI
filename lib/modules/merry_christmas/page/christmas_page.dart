import 'package:change_language/modules/merry_christmas/controller/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ChristMasPage extends GetView<MyAnimationController> {
  const ChristMasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: Container(
              width: 300,
              height: 200,
              color: Colors.red,
            ),
          ).animate().scale(duration: 200.ms, curve: Curves.bounceOut),
        );
      }),
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: StreamBuilder<double>(
            builder: (_, snapshot) => Text(
              snapshot.data.toString(),
            ),
          ),
          // child: Container(
          //   width: 50,
          //   height: 100,
          //   color: Colors.red,
          // )
          //     .animate(
          //         // onPlay: (controller) => controller.repeat(reverse: true),
          //         )
          //     .shimmer(delay: 400.ms, duration: 1800.ms)
          //     .shake(hz: 4, curve: Curves.easeInOutCubic)
          //     .scaleXY(end: 1.1, duration: 600.ms)
          //     .then(delay: 600.ms)
          //     .scaleXY(end: 1 / 1.1),
        ),
      ),
    );
  }
}
