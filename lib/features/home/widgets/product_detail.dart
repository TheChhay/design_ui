// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_ui/features/controller/default_controller.dart';
import 'package:design_ui/features/home/home_page.dart';
import 'package:design_ui/features/layout/default_layout.dart';
import 'package:flutter/material.dart';

import 'package:design_ui/model/product_model.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

void _showMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Message'),
        content: const Text(
          'Please add Quantity. Thanks!',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal:15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow),
                child: const Text('OK', style: TextStyle(color: Colors.black),)),
          ),
        ],
      );
    },
  );
}

void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pop(true);
      });
      return LottieBuilder.asset('assets/animation/loading.json');
    },
  );
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
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 5),
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
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 5),
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
                if (widget.product.qty == 0) {
                  _showMessage(context);
                } else {
                  int index = controller.orderProducts.indexOf(widget.product);
                  if (index != -1) {
                    controller.orderProducts[index] = widget.product;
                  } else {
                    controller.orderProducts.add(widget.product);
                  }
                  print(controller.orderProducts.length);
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DefaultLayout(),
                    ),
                  );
                  _showPopup(context);
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow),
                child: const Text(
                  'Order now!',
                  style: TextStyle(
                      fontSize: 18,
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
