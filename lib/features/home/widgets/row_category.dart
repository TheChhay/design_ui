import 'package:design_ui/features/controller/default_controller.dart';
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
  DefaultController controller = Get.put(DefaultController());
  List<Tab> tabList =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabList = controller.categories.map((c)=> Tab(child: Text(c.name!))).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: (){
              controller.indexSelectedCategory.value = ++index;
            },
            child: Text(controller.categories[index].name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
          );
        },
      ),
    );
  }
  

}
