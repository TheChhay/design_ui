import 'package:design_ui/features/controller/default_controller.dart';
import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/features/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final DefaultController controller = Get.put(DefaultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (controller.orderProducts.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Order',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Please explore some food!',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.orderProducts.length,
                      itemBuilder: (_, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  product: controller.orderProducts[index],
                                ),
                              ),
                            );
                          },
                          title: Text(controller.orderProducts[index].name!),
                          subtitle: Row(
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              Text(
                                'Quantity: ${controller.orderProducts[index].qty}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                'Amount; \$ ${controller.orderProducts[index].amount}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: controller.orderProducts.isEmpty
                      ? TextButton(
                          child: const Text(
                            'Order somethings...🤤😝',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DefaultLayout(),
                              ),
                            );
                          },
                        )
                      : TextButton(
                          child: const Text(
                            'Check out now',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            DateTime now = DateTime.now();
                            controller.historyProducts =
                                List.from(controller.orderProducts);
                            for (int i = 0;
                                i < controller.historyProducts.length;
                                i++) {
                              String? formattedDate =
                                  DateFormat('yyyy-MMM-dd h:mma').format(now);
                              formattedDate = formattedDate
                                  .replaceFirst('AM', 'am')
                                  .replaceFirst('PM', 'pm');
                              controller.historyProducts[i].orderDate = formattedDate;
                            }
                            controller.orderProducts.clear();
                            for(int i=0; i<controller.dataProduct.length; i++){
                              controller.dataProduct[i].qty = 0;
                              // controller.orderProducts[i].amount = 0;
                            }
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
