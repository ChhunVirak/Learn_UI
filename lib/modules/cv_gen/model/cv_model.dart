// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:change_language/modules/cv_gen/model/year_data_model.dart';

import 'place_model.dart';

class CvModel {
  FormatModel? formatModel;
  String? name;
  String? age;
  String? gender;
  String? tel;
  String? email;
  String? position;
  Place? address;
  Place? placeofbirth;
  String? nationality;
  String? maritalStatus;
  List<YearData>? educations;
  List<YearData>? experiences;
  List<LangaugeData>? languages;
  List<String>? hobbys;
  List<Reference>? references;
  CvModel({
    this.formatModel,
    this.name,
    this.age,
    this.gender,
    this.tel,
    this.email,
    this.position,
    this.address,
    this.placeofbirth,
    this.nationality,
    this.maritalStatus,
    this.educations,
    this.experiences,
    this.languages,
    this.hobbys,
    this.references,
  });
}

class Reference {
  String? name;
  String? phone;
  String? position;
  Reference({
    this.name,
    this.phone,
    this.position,
  });

  String get getPhoneFormat => '(+855) $phone';
}

class LangaugeData {
  Languages lang;
  Level level;
  LangaugeData({
    required this.lang,
    required this.level,
  });

  String get getlanguage => lang.text.capitalizeFirst ?? '';
  String get getlevel => level.text.capitalizeFirst ?? '';
}

enum Level { native, good, normal }

extension LevelValue on Level {
  String get text => toString().split('.').last;
}

enum Languages { khmer, english, thai }

extension LanguagesValue on Languages {
  String get text => toString().split('.').last;
}

enum Gender { male, female, other }

extension GenderValue on Gender {
  String get text => toString().split('.').last;
}

enum MaritalStatus { married, single, other }

extension MaritalStatusValue on MaritalStatus {
  String get text => toString().split('.').last.capitalizeFirst ?? '';
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
