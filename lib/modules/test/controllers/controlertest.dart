import 'package:change_language/helpers/api_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controllertest extends GetxController {
  final apibase = ApiBaseHelper();

  final username = ''.obs;

  // login() {
  // apibase.onNetworkRequesting(
  //     url: 'http://172.23.5.236:8081/app_real_estate/api/login.php',
  //     methode: METHODE.post,
  //     isAuthorize: false,
  //     body: {'username': username.value}).then((value) {
  //   debugPrint('$value');
  // }).onError((ErrorModel error, stackTrace) {
  //   debugPrint('${error.bodyString}');
  // });

  Future login() async {
    String url = "http://172.23.5.236:8081/a1/php/login_user.php";

    var response =
        await http.post(Uri.parse(url), body: {"email": "sss`12234"});
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint("debug => ${response.body}");
    } else {
      throw Exception('Failed to load data!');
    }

    // }
  }
}
