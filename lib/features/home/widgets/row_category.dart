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
  List<CategoryModel> prictItems = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
              controller.categories.length,
              (index) => _item(
                    category: controller.categories[index],
                    onSelected: (bool value) {
                      if (value) {
                        prictItems.add(controller.categories[index]);
                      } else {
                        prictItems.remove(controller.categories[index]);
                      }
                    },
                  ))
        ],
      ),
    );
  }

  Widget _item({CategoryModel? category, ValueChanged<bool>? onSelected}) {
    bool _isSelected = false;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          onSelected!(_isSelected);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(1, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: _isSelected ? Colors.yellow : Colors.grey.shade200,
          ),
          child: Text(
            category!.name!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
