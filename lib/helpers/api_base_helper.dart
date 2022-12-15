import 'dart:convert';
import 'package:get/get_connect.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

class ApiBaseHelper extends GetConnect {
  Future<dynamic> onNetworkRequesting({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required METHODE? methode,
    bool isAuthorize = true,
    bool isConvertToByte = false,
  }) async {
    final requestUrl = url;
    Map<String, String> requestHeader = header ??
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': isAuthorize ? 'Bearer $token' : ''
        };
    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(requestUrl, headers: requestHeader);
          return _returnResponse(response, isConvertToByte);
        case METHODE.post:
          if (body != null) {
            final response = await post(requestUrl, json.encode(body),
                headers: requestHeader);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
            const ErrorModel(bodyString: 'Body must be included'),
          );

        case METHODE.delete:
          final response = await delete(requestUrl, headers: requestHeader);
          return _returnResponse(response, isConvertToByte);
        case METHODE.update:
          if (body != null) {
            final response = await put(requestUrl, json.encode(body),
                headers: requestHeader);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
            const ErrorModel(bodyString: 'Body must be included'),
          );

        default:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response, bool isReturnBytes) {
    switch (response.statusCode) {
      case 200:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        break;
      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
    }
  }
}
