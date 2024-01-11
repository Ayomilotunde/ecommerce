import 'dart:convert';

import '../../api_endpoints.dart';
import '../network_helper.dart';

class ProductApi {
  static Future<dynamic> getProduct() async {
    final responseData = await NetworkHelper.getRequest(
      url: BaseUrl.getProductBaseUrl + EndpointDirectory.allProductEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return responseData;
  }

  static Future<dynamic> addFavorite({
    required int productId,
    required int quantity,
  }) async {
    Map products =  {
      'productId':productId,
      'quantity':quantity
    };

    final responseData = await NetworkHelper.postRequest(
      url: BaseUrl.getProductBaseUrl + EndpointDirectory.favoriteEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

      body: json.encode(
        <String, dynamic>{
          'userId': 11,
          'date': DateTime.now().toString(),
          'products': products
        },
      ),
    );
    return responseData;
  }
}
