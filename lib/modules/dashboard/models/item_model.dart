import 'package:flutter/material.dart';

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
