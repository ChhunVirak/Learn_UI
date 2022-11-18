// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:change_language/modules/cv_gen/model/year_data_model.dart';
import 'package:flutter/material.dart';

import 'place_model.dart';

class CvModel {
  FormatModel? formatModel;
  String? name;
  String? age;
  String? gender;
  String? tel;
  String? email;
  String? position;
  Place? placeofbirth;
  String? nationality;
  String? maritalStatus;
  List<YearData>? educations;
  List<YearData>? experiences;
  CvModel({
    this.formatModel,
    this.name,
    this.age,
    this.gender,
    this.tel,
    this.email,
    this.position,
    this.placeofbirth,
    this.nationality,
    this.maritalStatus,
    this.educations,
    this.experiences,
  });
}

enum Gender { male, female, other }

extension GenderValue on Gender {
  String get text => toString().split('.').last;
}

enum MaritalStatus { married, single, other }

extension MaritalStatusValue on MaritalStatus {
  String get text =>
      toString().split('.').last[0].toUpperCase() +
      toString().split('.').last.substring(1);
}

class CvFontSize {
  static const L = 16.0;
  static const M = 14.0;
  static const S = 12.0;
}

class FormatModel {
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;

  FormatModel({
    this.color = Colors.black,
    this.fontWeight,
    this.fontSize,
  });
}
