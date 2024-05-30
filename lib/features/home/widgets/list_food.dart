import 'package:flutter/material.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height * 0.2,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          _cardFood(
            price: 100,
            title: 'Pizza',
          ),
          _cardFood(
            price: 100,
            title: 'Pizza',
          ),
        ],
      ),
    );
  }

  @override
  Widget _cardFood(
      {String? img, int? price, String? title, VoidCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          // Container(
          //   child: Image.asset(img!),
          //   width: 200,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title!,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  price!.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
