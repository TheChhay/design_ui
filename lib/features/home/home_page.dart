import 'package:design_ui/features/home/widgets/list_food.dart';
import 'package:design_ui/features/home/widgets/row_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('searching...');
            },
          ),
          IconButton(
              icon: const Icon(Icons.filter_alt_outlined), onPressed: () {})
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const RowCategory(),
                // SizedBox(height: 20,),
                // ListFood(),
                Text('hgvg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
