// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_ui/features/controller/default_controller.dart';
import 'package:flutter/material.dart';

import 'package:design_ui/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    DefaultController controller = Get.put(DefaultController());
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Text('Quantity: ',
                                  style: const TextStyle(fontSize: 18)),
                                  Text(
                              '${product.qty}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 140,),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 32,
                                  ),
                                  onPressed: () {}),
                            ),
                            
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 32,
                                  ),
                                  onPressed: () {}),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow),
                child: const Text(
                  'Order now!',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
