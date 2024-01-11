 import 'dart:convert';


import '../../api_endpoints.dart';
import '../network_helper.dart';

class UserApi {
  static Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    final responseData = await NetworkHelper.postRequest(
      url: BaseUrl.getProductBaseUrl + EndpointDirectory.loginEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'username': email,
          'password': password,
        },
      ),
    );
    return responseData;
  }

static Future<dynamic> createUser({
    required String email,
    required String fullName,
    required String password,
  }) async {
    final responseData = await NetworkHelper.postRequest(
      url: BaseUrl.getProductBaseUrl + EndpointDirectory.registerEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'username':fullName,
          'password': password,
        },
      ),
    );
    return responseData;
  }



}
