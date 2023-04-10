import 'package:change_language/modules/auth/controller/base_api.dart';
import 'package:http/http.dart';

class Service implements ApiInterface {
  @override
  Future<Response> fetchApi() async {
    return await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  }
}
