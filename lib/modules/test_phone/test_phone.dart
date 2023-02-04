import 'package:change_language/modules/test_phone/test_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TestPhone extends GetView<TestPhoneController> {
  const TestPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestPhoneController>(
        init: TestPhoneController(),
        builder: (_) {
          return GestureDetector(
            onTap: () {
              controller.onChangeColor();
            },
            child: Scaffold(
              backgroundColor: controller.bgColor,
            ),
          );
        });
  }
}
