import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PhoneController extends GetxController with StateMixin<int> {
  int a = 0;
  bool isLogin = false;

  void checkUser(BuildContext context) {
    if (isLogin == true) {
      context.go('/');
    }
  }
}
