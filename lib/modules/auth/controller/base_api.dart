import 'package:http/http.dart';

mixin ApiInterface {
  Future<Response> fetchApi();
}
