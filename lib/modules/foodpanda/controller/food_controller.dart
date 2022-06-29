import 'package:change_language/helpers/api_base_helper.dart';
import 'package:change_language/modules/foodpanda/model/foodpanda_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  final apibasehelper = ApiBaseHelper();

  final model = PizzaModel().obs;
  final listPizza = <PizzaModel>[].obs;
  final isloading = false.obs;

  Future getListPizza() async {
    isloading.value = true;
    apibasehelper
        .onNetworkRequesting(
      url: 'https://gunter-food-api.herokuapp.com/pizza',
      methode: METHODE.get,
      isAuthorize: false,
    )
        .then(
      (value) {
        listPizza.clear();
        value.map((e) {
          model.value = PizzaModel.fromJson(e);
          listPizza.add(model.value);
        }).toList();
        isloading.value = false;
      },
    );
  }
}
