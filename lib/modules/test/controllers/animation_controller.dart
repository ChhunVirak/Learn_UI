import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  double stepValue = 1 / 3;
  double total = 0.0;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    super.onInit();
  }

  Future<void> animatedNext() async {
    total = total + stepValue;
    animationController!.reset();
    animationController!.forward();
    animationController!.addListener(() {
      update();
    });
  }

  // @override
  // void onClose() {
  //   animationController?.dispose();
  //   super.onClose();
  // }
}
