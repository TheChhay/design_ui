import 'package:flutter/material.dart';

class RowCategory extends StatelessWidget {
  const RowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        children: [
          _item(name: 'All', isSelected: true),
          _item(
            name: 'Khmer food',
          ),
          _item(
            name: 'fast food',
          ),
        ],
      ),
    );
  }

  @override
  Widget _item({String? name, bool? isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(1, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: isSelected == true ? Colors.yellow : Colors.grey.shade200,
        ),
        child: Text(
          name!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
