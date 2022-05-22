import 'package:change_language/modules/app_tour/screens/testscreen.dart';
import 'package:change_language/modules/log_in/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../home/screens/homescreen.dart';

class ItemModel {
  final String? title;
  final String? date;
  final Color? sheetColor;
  final double? progress;
  final Widget? item;
  ItemModel({
    this.sheetColor,
    this.progress,
    this.item,
    this.title,
    this.date,
  });
}

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
];
