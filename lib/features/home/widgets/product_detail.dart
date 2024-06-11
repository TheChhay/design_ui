// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_ui/features/controller/default_controller.dart';
import 'package:design_ui/features/home/home_page.dart';
import 'package:design_ui/features/layout/default_layout.dart';
import 'package:flutter/material.dart';

import 'package:design_ui/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    DefaultController controller = Get.put(DefaultController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.product.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: widget.product.imageUrl != ''
                  ? Image.asset(
                      widget.product.imageUrl!,
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
                      'Product name: ${widget.product.name!}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '\$ ${widget.product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      'Description: ${widget.product.description}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text('Total: ${widget.product.amount}',
                        style: const TextStyle(fontSize: 18)),
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
                                '${widget.product.qty}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 140,
                        ),
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
                                  onPressed: () {
                                    setState(() {
                                      if (widget.product.qty != 0) {
                                        widget.product.qty =
                                            widget.product.qty! - 1;
                                        widget.product.amount =
                                            widget.product.price! *
                                                widget.product.qty!;
                                        Product? item = controller.dataProduct
                                            .firstWhere((item) =>
                                                item.id == widget.product.id);
                                        item.qty = widget.product.qty;
                                      }
                                    });
                                  }),
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
                                  onPressed: () {
                                    setState(() {
                                      widget.product.qty =
                                          widget.product.qty! + 1;
                                      widget.product.amount =
                                          widget.product.price! *
                                              widget.product.qty!;
                                      Product? item = controller.dataProduct
                                          .firstWhere((item) =>
                                              item.id == widget.product.id);
                                      item.qty = widget.product.qty;
                                      print(widget.product.qty);
                                    });
                                  }),
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
              onPressed: () {
                  int index = controller.orderProducts.indexOf(widget.product);
                  if(index != -1){
                    controller.orderProducts[index] = widget.product;
                  }else{
                    controller.orderProducts.add(widget.product);
                  }
                print(controller.orderProducts.length);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DefaultLayout(),
                  ),
                );
              },
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
