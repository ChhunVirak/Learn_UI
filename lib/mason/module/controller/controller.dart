import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/api_base_helper.dart';

class Controller extends GetxController {
  final name = ''.obs;

  final _apiBaseHelper = ApiBaseHelper();

  ///Fetch Model
  final model = Model().obs;
  final listModel = <Model>[].obs;
  final fetchModelLoading = false.obs;
  final fetchModelLoadingMore = false.obs;

  Future<List<Model>> fetchName(int page) async {
    if (page == 0) {
      fetchModelLoading(true); //shimmer => Yes
      fetchModelLoadingMore(false); //More => No
    } else {
      fetchModelLoading(false); //shimmer => No
      fetchModelLoadingMore(true); //More => Yes
    }
    await _apiBaseHelper
        .onNetworkRequesting(
      url: 'URL_HERE?page=$page',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      debugPrint('Debugging Success FetchName  : $value');

      if (page == 0) {
        listModel.clear();
      }
      value['DESTINATION_KEY'].map((element) {
        listModel.add(Model.fromJson(element));
      }).toList();

      ///
      model.value = Model.fromJson(value['DESTINATION_KEY']);

      debugPrint('Debugging Success FetchName : $value');

      fetchModelLoading(false);
      fetchModelLoadingMore(false);

    }).onError((ErrorModel error, stackTrace) {
      
      fetchModelLoading(false);
      fetchModelLoadingMore(false);

      debugPrint('Debugging Error FetchName : StatusCode(${error.statusCode})');
      debugPrint('Debugging Error FetchName : Body : ${error.bodyString}');
    });
    return listModel;
  }

  Future<void> fetchNameMore() async {}
}

class Model {
  Model();
  factory Model.fromJson(e) => Model();
}
