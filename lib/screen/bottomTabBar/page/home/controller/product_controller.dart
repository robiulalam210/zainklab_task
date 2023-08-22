// ignore_for_file: unrelated_type_equality_checks, invalid_use_of_protected_member, duplicate_ignore, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_list_model.dart';
import '../repository/repository.dart';

class ProductController extends GetxController {
  final productsListData =  <ProductsModelList>[].obs;
  final isLoadingProdactListFunction = false.obs;
  TextEditingController searchController = TextEditingController();
  var namedata = "".obs;
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 0), () {
      getProductData();
    });
  }



  void getProductData() async {
    try {
      await ProductRepository.getproductData().then((value) {
        if (value != null) {

          print(value);
          productsListData.value = value;
          isLoadingProdactListFunction.value = true;
        }
      });
      //  isLoading.value = true;
    } catch (err) {
      // ignore: avoid_print
    } finally {
      //  isLoading.value = false;
    }
  }

}
