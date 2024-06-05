import 'package:design_ui/features/home/controller/home_controller.dart';
import 'package:design_ui/model/category_model.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCategory extends StatefulWidget {
  const RowCategory({super.key});

  @override
  State<RowCategory> createState() => _RowCategoryState();
}

class _RowCategoryState extends State<RowCategory> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: Colors.yellow,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(child: Text(controller.categories[0].name!),),
        Tab(child: Text(controller.categories[1].name!),),
        Tab(child: Text(controller.categories[2].name!),),
        Tab(child: Text(controller.categories[3].name!),),
        Tab(child: Text(controller.categories[4].name!),),
      ],
    );
  }

}
