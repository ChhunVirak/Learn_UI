import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../helpers/api_base_helper.dart';

class DadadController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();

  ///Fetch Model
  final dadadModel = DadadModel().obs;
  final listDadad = <DadadModel>[].obs;
  final fetchDadadLoading = false.obs;

  Future<List<DadadModel>> fetchDadad(int page) async {
    fetchDadadLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'URL_HERE', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      debugPrint('Debugging Success fetchDadad : $response');

      //list
      listDadad.clear();
      response['JSON_KEY'].map((element) {
        listDadad.add(DadadModel.fromJson(element));
      }).toList();

      ///

      fetchDadadLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      fetchDadadLoading(false);

      debugPrint(
          'Debugging Error fetchDadad : StatusCode(${error.statusCode})');
      debugPrint('Debugging Error fetchDadad : Body : ${error.bodyString}');
    });

    //list
    return listDadad;
  }
}

class DadadModel {
  DadadModel();
  factory DadadModel.fromJson(e) => DadadModel();
}
