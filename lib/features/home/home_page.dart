import 'package:design_ui/features/home/controller/home_controller.dart';
import 'package:design_ui/features/home/widgets/list_food.dart';
import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/features/home/widgets/row_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Menu'),

      // ),
      body: DefaultTabController(
        length: controller.categories.length,
        initialIndex: 0,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text(
                  'Delivery codes',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.yellow,
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
                pinned: true,
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Category',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              )),
              const SliverToBoxAdapter(
                child: RowCategory(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListFood(),
                ),
              )
            ],
          ),
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
