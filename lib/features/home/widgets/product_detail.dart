// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:design_ui/model/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:product.imageUrl != ''
                  ? Image.asset(product.imageUrl!) 
                  : Container(color: Colors.grey),
          ),
            Text(product.name!),
            Text('${product.price}'),
            Text('${product.description}'),
        ]
      ),
    );
  }
}
