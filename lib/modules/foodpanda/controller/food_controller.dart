import 'package:change_language/helpers/api_base_helper.dart';
import 'package:change_language/modules/foodpanda/model/foodpanda_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  final apibasehelper = ApiBaseHelper();

  final model = PizzaModel().obs;
  final listPizza = <PizzaModel>[].obs;
  final isloading = false.obs;

  Future<List<PizzaModel>> getListPizza() async {
    isloading.value = true;
    try {
      await apibasehelper
          .onNetworkRequesting(
        url: 'https://gunter-food-api.herokuapp.com/pizza',
        methode: METHODE.get,
        isAuthorize: false,
      )
          .then(
        (value) {
          debugPrint('Error Apr');
          listPizza.clear();
          value.map((e) {
            model.value = PizzaModel.fromJson(e);
            listPizza.add(model.value);
          }).toList();
          isloading.value = false;
        },
      ).onError(
        (ErrorModel error, _) {
          debugPrint('Error => ${error.bodyString}');
          isloading.value = false;
        },
      );
    } catch (_) {
      debugPrint('Error => $_');
    }
    return listPizza;
  }
}
