import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;

  final name1 = 'Virak'.obs;
  final name2 = 'Virak'.obs;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    super.onInit();
  }

  Stream<double> getRandomValues() async* {
    var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
}
