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
        title: Text(product.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: product.imageUrl != ''
                  ? Image.asset(
                      product.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                        color: Colors.grey,
                      ),
                  ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Product name: ${product.name!}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      'Description: ${product.description}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(onPressed: (){}, child: Text('Buy now!'))
          ],
        ),
      ),
    );
  }
}
