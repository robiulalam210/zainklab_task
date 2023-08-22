import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../utils/colors_code.dart';
import '../../../../utils/styles.dart';
import 'controller/product_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static void showCustomDialog(
    BuildContext context, {
    required data,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 500,
              width: 700,
              child: Column(
                children: [
                  ListTile(
                      title: Text(data.title),
                      subtitle: Text(data.category),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data.thumbnail),
                      ),
                      trailing: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: () {},
                        icon: Icon(Icons.person_add_alt_1),
                        label: Text("Flow"),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 300,
                    child: ClipRRect(
                      child: Image.network(data.thumbnail,height: 280),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    child: Center(
                        child: Text(
                      "View Post",
                      style: Style.dashboardBlackText700,
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _HomePageState extends State<HomePage> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(

        body:  Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 18, right: 18, top: 8,bottom: 12),
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
                          setState(() {
                            productController.namedata.value =
                                value.toString();
                          });
                        },
                        controller:
                        productController.searchController,
                        cursorColor: ColorsCode.text_primary_color,
                        autofocus: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: ColorsCode.icon_primary_colors,
                          ),
                          border: InputBorder.none,
                          hintText: "Search Service Item".tr,
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
                                  return GestureDetector(
                                    onTap: () {
                                      HomePage.showCustomDialog(context, data: data);
                                      //Get.defaultDialog(title: data.title.toString());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                          data.thumbnail.toString()),
                                    ),
                                  );
                                } else if (productController.namedata.value
                                    .toString()
                                    .toLowerCase()
                                    .contains(productController
                                        .searchController.text
                                        .toLowerCase())) {
                                  return GestureDetector(
                                    onTap: () {
                                      HomePage.showCustomDialog(context, data: data);
                                      //Get.defaultDialog(title: data.title.toString());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                          data.thumbnail.toString()),
                                    ),
                                  );
                                }else{
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
