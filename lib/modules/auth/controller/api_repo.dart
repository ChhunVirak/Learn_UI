import 'package:http/http.dart' show Response;

mixin RouteRepo {
  String? post;
  String? posts;
  String? comments;
  String? albums;
  String? photos;
  String? todos;
  String? users;
  Future<Response> fetchListPosts();
  Future<Response> fetchListComments();
  Future<Response> fetchListAlbums();
  Future<Response> fetchListPhotos();
  Future<Response> fetchListTodos();
  Future<Response> fetchListUsers();
}
