// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemModel {
  final String? title;
  final String? date;
  final Color? sheetColor;
  final double? progress;
  final Widget? item;

  ItemModel({
    this.title,
    this.date,
    this.sheetColor,
    this.progress,
    this.item,
  });
}
