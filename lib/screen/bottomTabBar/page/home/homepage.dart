import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/product_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  ProductController tabController=Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    ));
  }
}
