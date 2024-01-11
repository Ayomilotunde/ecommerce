import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static late http.Response response;

  static Future<dynamic> getRequest(
      {required String url, Map<String, String>? headers}) async {
    response = await http.get(
      Uri.parse(url),
      headers: headers,
    ).timeout(const Duration(seconds: 60));
    return response;
  }

  static Future<dynamic> postRequest(
      {required String url, Map<String, String>? headers, Object? body}) async {
    response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    ).timeout(const Duration(seconds: 60));
    return response;
  }
  static Future<dynamic> deleteRequest(
      {required String url, Map<String, String>? headers, Object? body}) async {
    response = await http.delete(
      Uri.parse(url),
      headers: headers,
    ).timeout(const Duration(seconds: 60));
    return response;
  }

  static Future<dynamic> putRequest(
      {required String url,
      Map<String, String>? headers,
        Encoding? encoding,
      required Object body}) async {
    response = await http.put(
      Uri.parse(url),
      encoding: encoding,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    ).timeout(const Duration(seconds: 60));
    return response;
  }
}
