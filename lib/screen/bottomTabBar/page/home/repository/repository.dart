import 'dart:convert';

import 'package:get/get.dart';

import '../../../../../utils/urls_and_app_constants.dart';
import '../model/product_list_model.dart';

class ProductRepository {

  static Future<List<ProductsModelList>?> getproductData() async {
     final connect = GetConnect();

    try {
      final response = await connect.get(
          AppUrls.URL

      );
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonData = json['products'];
        var jsonDataencd = jsonEncode(jsonData);

        return  productsModelListFromJson(jsonDataencd);

      }
    } on Exception {
      return null;
    }
    return null;
  }
}