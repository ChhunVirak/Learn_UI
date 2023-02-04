import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TestPhoneController extends GetxController {
  Random random = Random();
  Color bgColor = Colors.white;

  void onChangeColor() {
    final colo = 0xff000000 + random.nextInt(100000);
    bgColor = Color(colo);
    update();
  }
}
