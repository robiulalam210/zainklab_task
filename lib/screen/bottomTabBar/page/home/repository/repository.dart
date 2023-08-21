import 'dart:convert';

import 'package:get/get.dart';

import '../../../../../utils/urls_and_app_constants.dart';
import '../model/product_list_model.dart';

class ProductRepository {

  static Future<ProductsModelList?> getproductData() async {
     final connect = GetConnect();
    // final FlutterSecureStorage storage = FlutterSecureStorage();
    // var token = await storage.read(key: 'TOKEN');
    try {
      final response = await connect.get(
          AppUrls.URL
        // headers: {
        //   'Accept': 'application/json',
        //   'Authorization': 'Bearer ${token}'
        // },
      );
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonData = json['products'];
        var jsonDataencd = jsonEncode(jsonData);
        print(jsonDataencd);

        return productsModelListFromJson(jsonDataencd);
      }
    } on Exception {
      return null;
    }
    return null;
  }
}