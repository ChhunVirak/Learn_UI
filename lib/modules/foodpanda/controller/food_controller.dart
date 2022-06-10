import 'package:change_language/modules/foodpanda/model/foodpanda_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  FoodModel a = FoodModel();

  final foodList = <FoodModel>[
    FoodModel(title: 'Chhaileng'),
    FoodModel(),
    FoodModel(),
    FoodModel(),
    FoodModel(),
  ];
}
