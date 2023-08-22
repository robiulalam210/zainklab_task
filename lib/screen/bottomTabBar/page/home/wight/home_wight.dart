import 'package:flutter/material.dart';

import '../../../../../utils/styles.dart';

class HomePopupfunction {
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
                      title: Text(data.title,style: Style.allnormaltext,),
                      subtitle: Text(data.category,style: Style.allnormaltext,),
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
                  Style.distan_size5,
                  SizedBox(
                    height: 300,
                    child: ClipRRect(
                      child: Image.network(data.thumbnail, height: 280),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
               Style.distan_size15,
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

Widget GridViewData(context, data) {
  return GestureDetector(
    onTap: () {
      HomePopupfunction.showCustomDialog(context, data: data);
      //Get.defaultDialog(title: data.title.toString());
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(data.thumbnail.toString()),
    ),
  );
}
