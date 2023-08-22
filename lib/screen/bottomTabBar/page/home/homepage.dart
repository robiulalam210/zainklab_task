import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../utils/colors_code.dart';
import '../../../../utils/styles.dart';
import 'controller/product_controller.dart';
import 'wight/home_wight.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 18, right: 18, top: 8, bottom: 12),
                    // height: ResponsiveHelper.isLandScriptMode(context)
                    //     ? MediaQuery.of(context).size.height * .12
                    //     : MediaQuery.of(context).size.height * .08,
                    //  width: Get.size.width * .75,
                    decoration: BoxDecoration(
                        color: ColorsCode.page_background_color,
                        //E9F2F2
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: TextField(
                        scrollPadding: EdgeInsets.all(5),
                        onChanged: (value) {
                          print(value.toString());

                          productController.namedata.value = value.toString();
                        },
                        controller: productController.searchController,
                        cursorColor: ColorsCode.text_primary_color,
                        autofocus: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: ColorsCode.icon_primary_colors,
                          ),
                          border: InputBorder.none,
                          hintText: "Search Product Item".tr,
                          hintStyle: Style.text_hind_style,
                        ),
                        style: Style.text_filed_style),
                  ),
                  Style.distan_size2,
                  //  Text(productController.productsListData.value.length.toString()),
                  productController.isLoadingProdactListFunction.value == true
                      ? productController.productsListData!.isNotEmpty
                          ? MasonryGridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  productController.productsListData!.length,
                              shrinkWrap: true,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int index) {
                                var data =
                                    productController.productsListData![index];
                                if (productController
                                    .searchController.text.isNotEmpty) {
                                  return GridViewData(context, data);
                                } else if (productController.namedata.value
                                    .toString()
                                    .toLowerCase()
                                    .contains(productController
                                        .searchController.text
                                        .toLowerCase())) {
                                  return GridViewData(context, data);
                                } else {
                                  return Container();
                                }
                              },
                            )
                          : Container()
                      : Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
