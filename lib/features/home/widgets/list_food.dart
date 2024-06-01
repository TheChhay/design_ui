import 'package:design_ui/features/home/controller/home_controller.dart';
import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListFood extends StatelessWidget {
  ListFood({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: controller.dataProduct.length,
      itemBuilder: (context, index) {
        return _cardFood(context, controller.dataProduct[index]);
      },
    );
  }

  Widget _cardFood(BuildContext context, Product product) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: product),
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: 150, // Fixed height for image container
              width: MediaQuery.of(context).size.width / 2.5,
              child: product.imageUrl != ''
                  ? Image.asset(product.imageUrl!) 
                  : Container(color: Colors.grey),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Ensure proper spacing
                children: [
                  Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    product.name ?? 'name not available',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Text(
              product.description ?? 'Description not available',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
