import 'package:change_language/modules/auth/controller/api_repo.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController with RouteRepo {
  void fetchData() {}

  @override
  Future<http.Response> fetchListAlbums() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  }

  @override
  Future<http.Response> fetchListComments() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  }

  @override
  Future<http.Response> fetchListPhotos() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  }

  @override
  Future<http.Response> fetchListPosts() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  }

  @override
  Future<http.Response> fetchListTodos() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  }

  @override
  Future<http.Response> fetchListUsers() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  }
}
