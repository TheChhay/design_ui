import 'package:flutter/material.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _cardFood(context, price: 100, title: 'Pizza'),
                _cardFood(context, price: 100, title: 'Pizza'),
                _cardFood(context, price: 100, title: 'Pizza'),
                _cardFood(context, price: 100, title: 'Pizza'),
                _cardFood(context, price: 100, title: 'Pizza'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardFood(BuildContext context, {String? img, int? price, String? title, VoidCallback? onPress}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            SizedBox(
              height: 150, // Fixed height for image container
              width: MediaQuery.of(context).size.width / 2.2,
              child: img == null ? Container(color: Colors.grey) : Image.asset(img),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure proper spacing
                children: [
                  Text(
                    title!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    '\$${price!.toString()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

