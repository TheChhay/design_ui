import 'package:design_ui/features/controller/default_controller.dart';
import 'package:design_ui/features/home/widgets/food_card.dart';
import 'package:design_ui/features/home/widgets/product_detail.dart';
import 'package:design_ui/features/home/widgets/row_category.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DefaultController controller = Get.put(DefaultController());
//  final Location location = Location();
  int? selectedCategoryId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('location info ${location}');
    selectedCategoryId = 1;
  }
  @override
  Widget build(BuildContext context) {
    List<Product> filteredItems = controller.dataProduct
        .where((item) => item.categoryId == selectedCategoryId)
        .toList();
    return DefaultTabController(
        length: controller.categories.length,
        child: Scaffold(
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
          body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategoryId = controller.categories[index].id;
                      });
                    },
                    child: Text(controller.categories[index].name!, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategoryId == controller.categories[index].id
                          ? Colors.yellow
                          : Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedCategoryId == 1  ? controller.dataProduct.length : filteredItems.length,
              itemBuilder: (context, index) {
                return selectedCategoryId == 1 ? FoodCard(product: controller.dataProduct[index]) : FoodCard(
                  product: filteredItems[index],
                );
              },
            ),
          ),
        ],
      ),
        )
    );
  }
}

class _customSearchDelegate extends SearchDelegate {
  DefaultController controller = Get.put(DefaultController());

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
