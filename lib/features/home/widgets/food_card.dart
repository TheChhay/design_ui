import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:flutter/material.dart';
class FoodCard extends StatelessWidget {
  final Product product;
  const FoodCard({super.key,required this.product});
  
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
      child: Column(
        
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: product.imageUrl != ''
                ? Image.asset(product.imageUrl!)
                : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Container(color: Colors.grey),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ensure proper spacing
              children: [
                Text(
                  '\$${product.price.toString()}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.name ?? 'name not available',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}