import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  final rotate = 0.0.obs;
  animet() {
    debugPrint('Work');
    double left = 3.14 / 12;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (timer.tick == 1) {
        rotate.value = left;
      } else if (timer.tick == 2) {
        rotate.value = -left;
      } else if (timer.tick == 3) {
        rotate.value = left;
      } else if (timer.tick == 4) {
        rotate.value = -left;
      } else {
        timer.cancel();

        rotate.value = 0;
      }
    });
  }
}
