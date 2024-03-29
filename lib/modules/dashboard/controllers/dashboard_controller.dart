import 'package:change_language/modules/foodpanda/screen/foodpanda_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_tour/screens/testscreen.dart';
import '../../home/screens/homescreen.dart';
import '../../kla_klok/screen/kla_klok_screen.dart';
import '../../log_in/screens/login_screen.dart';
import '../../qr_code/screen/qr_code.dart';
import '../../real_estate/screen/real_estate_home.dart';
import '../models/item_model.dart';

class DashBoardController extends GetxController
    with GetTickerProviderStateMixin {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  final currentItem = 0.obs;
  final isnightMode = false.obs;
  final itemList = <ItemModel>[
    ItemModel(
      sheetColor: Colors.red,
      title: 'Book Screen',
      progress: 0.2,
      date: '12-Mar-2022',
      item: const BookScreen(),
    ),
    ItemModel(
      sheetColor: Colors.teal,
      title: 'App Tour',
      progress: 0.2,
      date: '12-Mar-2022',
      item: const Apptour(),
    ),
    ItemModel(
      sheetColor: Colors.yellow,
      title: 'Login Screen',
      progress: 0.0,
      date: '22-May-2022',
      item: const LoginScreen(),
    ),
    ItemModel(
      sheetColor: Colors.indigo,
      title: 'QR Screen',
      progress: 1.0,
      date: '22-May-2022',
      item: const QrScreen(),
    ),
    ItemModel(
      sheetColor: Colors.pink[800],
      title: 'Food Panda',
      progress: 0,
      date: '9-June-2022',
      item: const FoodPandaHome(),
    ),
    ItemModel(
      sheetColor: Colors.pink[800],
      title: 'Real Estate',
      progress: 10,
      date: '9-June-2022',
      item: const RealEstate(),
    ),
    ItemModel(
      sheetColor: Colors.red[800],
      title: 'Kla Klok',
      progress: 10,
      date: '9-June-2022',
      item: const KlaKlok(),
    ),
  ].obs;
}
