// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:change_language/widgets/dynamic/dynamic.dart';
import 'package:flutter/material.dart';

class Anime extends StatelessWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dynamicMap = WidgetModel();
    return Scaffold(
      body: DynamicWidget(type: dynamicMap.type),
    );
  }
}

class WidgetModel {
  final String? type;
  final String? child;
  final String? children;
  WidgetModel({
    this.type,
    this.child,
    this.children,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'child': child,
      'children': children,
    };
  }

  factory WidgetModel.fromMap(Map<String, dynamic> map) {
    return WidgetModel(
      type: map['type'] != null ? map['type'] as String : null,
      child: map['child'] != null ? map['child'] as String : null,
      children: map['children'] != null ? map['children'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetModel.fromJson(String source) =>
      WidgetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
