import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Product product;
  const FoodCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Container(
              height: 150,
              child: product.imageUrl != ''
                  ? Image.asset(product.imageUrl!, fit: BoxFit.cover,)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(color: Colors.grey),
                    ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Ensure proper spacing
                children: [
                  Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.name ?? 'name not available',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
