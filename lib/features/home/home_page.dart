import 'package:design_ui/features/home/controller/home_controller.dart';
import 'package:design_ui/features/home/widgets/list_food.dart';
import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/features/home/widgets/row_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _customSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
                  const RowCategory(),
                  Container(
                      child: const Text(
                    'Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
                  // ListFood(),
                ],
              )
          ),
        ),
      );
  }
}

class _customSearchDelegate extends SearchDelegate {
  HomeController controller = Get.put(HomeController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in controller.dataProduct) {
      if (i.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i.name!);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetail(product: controller.dataProduct[index]),
                ),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in controller.dataProduct) {
      if (i.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i.name!);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetail(product: controller.dataProduct[index]),
                ),
              );
            },
          );
        });
  }
}
