// import 'package:change_language/helpers/api_base_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as https;

// class Controllertest extends GetxController {
//   final apiBaseHelper = ApiBaseHelper();

//   final username = ''.obs;

//   // login() {
//   // apibase.onNetworkRequesting(
//   //     url: 'http://172.23.5.236:8081/app_real_estate/api/login.php',
//   //     methode: METHODE.post,
//   //     isAuthorize: false,
//   //     body: {'username': username.value}).then((value) {
//   //   debugPrint('$value');
//   // }).onError((ErrorModel error, stackTrace) {
//   //   debugPrint('${error.bodyString}');
//   // });

//   Future login() async {
//     String url = "http://172.23.5.236:8081/a1/php/login_user.php";

//     var response =
//         await https.post(Uri.parse(url), body: {"email": "sss`12234"});
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       debugPrint("debug => ${response.body}");
//     } else {
//       throw Exception('Failed to load data!');
//     }
//   }

//   ///Fetch Post by Virak
//   final postmodel = PostModel().obs;
//   final listpost = <PostModel>[].obs;
//   Future onFetchPost() async {
//     apiBaseHelper
//         .onNetworkRequesting(
//             url: 'https://jsonplaceholder.typicode.com/posts',
//             methode: METHODE.get,
//             isAuthorize: false)
//         .then(
//       (response) {
//         listpost.clear();
//         response.map(
//           (e) {
//             postmodel.value = PostModel.fromJson(e);
//             listpost.add(postmodel.value);
//           },
//         ).toList();
//       },
//     ).onError((ErrorModel error, stackTrace) {
//       debugPrint('Something Error ${error.bodyString}');
//     });
//   }
// }

// class PostModel {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   PostModel({this.userId, this.id, this.title, this.body});

//   PostModel.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['userId'] = userId;
//     data['id'] = id;
//     data['title'] = title;
//     data['body'] = body;
//     return data;
//   }
// }
