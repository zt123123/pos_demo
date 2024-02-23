import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  String baseURL;
  Map<String, String> headers;
  int timeout;

  HttpRequest({this.baseURL = '', this.headers = const {}, this.timeout = 5});

  Future<dynamic> get(String url,
      {Map<String, String>? query, Map<String, String>? headers}) async {
    final uri = Uri.parse(baseURL + url).replace(queryParameters: query);
    final requestHeaders = {...this.headers, ...?headers};
    try {
      final response = await http
          .get(uri, headers: requestHeaders)
          .timeout(Duration(seconds: timeout));

      if (response.statusCode == 200) {
        return {
          "code": response.statusCode,
          "result": json.decode(response.body),
          "message": "ok",
        };
      } else {
        return {
          "code": response.statusCode,
          "result": null,
          "message": "fail",
        };
      }
    } catch (e) {
      // handle error
    }
  }
}
