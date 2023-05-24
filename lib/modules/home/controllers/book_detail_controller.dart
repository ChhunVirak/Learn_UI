import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/api_base_helper.dart';
import '../models/book_details.dart';

class BookDetailController extends GetxController with StateMixin<BookDetail> {
  final _apiBaseHelper = ApiBaseHelper();

  @override
  void onInit() {
    debugPrint('Detail Controller has been inited');
    super.onInit();
  }

  @override
  void onClose() {
    debugPrint('Detail Controller has been disposed');
    super.onClose();
  }

  Future fetchBookDetail(String? id) async {
    BookDetail bookDetail = BookDetail();
    debugPrint('Worked');
    change(null, status: RxStatus.loading());
    if (id == null) {
      await Future.delayed(const Duration(seconds: 1));
      change(null, status: RxStatus.error('ID not founded'));
      return;
    }
    _apiBaseHelper
        .onNetworkRequesting(
            url: 'https://api.itbook.store/1.0/books/$id',
            methode: METHODE.get,
            isAuthorize: false)
        .then((response) async {
      bookDetail = BookDetail.fromMap(response);

      change(bookDetail, status: RxStatus.success());
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          change(bookDetail.copyWith(price: 'Loading More'),
              status: RxStatus.loadingMore());
        },
      );
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          change(bookDetail.copyWith(price: 'Loaded'),
              status: RxStatus.success());
        },
      );
    }).onError((ErrorModel error, _) {
      change(null, status: RxStatus.error(error.bodyString));
    });
  }
}
