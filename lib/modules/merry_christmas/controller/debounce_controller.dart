import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebounceController extends GetxController {
  final name = ''.obs;

  @override
  void onInit() {
    debounce<String>(
      name,
      (v) {
        debugPrint(v);
      },
      time: const Duration(seconds: 2),
    );
    super.onInit();
  }
}
