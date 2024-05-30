import 'package:design_ui/features/home/widgets/list_food.dart';
import 'package:design_ui/features/home/widgets/row_category.dart';
import 'package:flutter/cupertino.dart';
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
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RowCategory(),
            ListFood(),
          ],
        ),
      )),
    );
  }
}
