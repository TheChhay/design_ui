import 'package:design_ui/features/controller/default_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    DefaultController controller =Get.put(DefaultController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: controller.historyProducts.length > 0 ? Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.historyProducts.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text(controller.historyProducts[index].name!),
              subtitle: Row(
                children: [
                  Text(controller.historyProducts[index].qty.toString()),
                  Text(controller.historyProducts[index].amount.toString()),
                  Text(controller.historyProducts[index].orderDate.toString()),
                ],
              ),
            );
          },
        ),
      )
      : Center(
        child: Text('No history', style: TextStyle(fontSize: 36),),
      ),
    );
  }
}
