import 'package:change_language/helpers/api_base_helper.dart';
import 'package:change_language/modules/home/models/book_details.dart';
import 'package:get/get.dart';

import '../models/book_model.dart';

class BookController extends GetxController {
  final apibasehelper = ApiBaseHelper();
  final bookList = <MyBook>[].obs;
  final loading = false.obs;

  Future fetchBookList() async {
    loading(true);
    apibasehelper
        .onNetworkRequesting(
            url: 'https://api.itbook.store/1.0/new',
            methode: METHODE.get,
            isAuthorize: false)
        .then((response) {
      bookList.clear();
      response['books'].map((json) {
        bookList.add(MyBook.fromJson(json));
      }).toList();
      loading(false);
    }).onError((ErrorModel error, stackTrace) {
      loading(false);
    });
  }

  final bookDetail = BookDetail().obs;
  Future fetchBookDetail(int id) async {
    loading(true);
    apibasehelper
        .onNetworkRequesting(
            url: 'https://api.itbook.store/1.0/books/$id',
            methode: METHODE.get,
            isAuthorize: false)
        .then((response) {
      bookDetail.value = BookDetail.fromJson(response);
      loading(false);
    }).onError((ErrorModel error, stackTrace) {
      loading(false);
    });
  }
}
