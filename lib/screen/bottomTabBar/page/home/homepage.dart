import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../utils/styles.dart';
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
                                onTap: () {
                                  showCustomDialog(context, data: data);
                                  //Get.defaultDialog(title: data.title.toString());
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child:
                                      Image.network(data.thumbnail.toString()),
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
                  ClipRRect(
                    child: Image.network(data.thumbnail),
                    borderRadius: BorderRadius.circular(20),
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
