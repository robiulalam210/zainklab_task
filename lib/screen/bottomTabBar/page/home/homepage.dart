import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'controller/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                productController.isLoadingProdactListFunction == true
                    ? productController.productsListData.value!.isNotEmpty
                        ? MasonryGridView.builder(
                            itemCount: productController
                                .productsListData.value!.length,
                            shrinkWrap: true,
                            crossAxisSpacing: 8,

                            mainAxisSpacing: 8,
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              var data =
                                  productController.productsListData![index];
                              return GestureDetector(
                                onTap: (){
                                  print(data.title);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(data.thumbnail.toString()),
                                ),
                              );
                            },
                          )
                        : Container()
                    : Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
