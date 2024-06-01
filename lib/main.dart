import 'dart:async';

import 'package:design_ui/features/home/home_page.dart';
import 'package:design_ui/features/home/widgets/list_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: ListFood(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud,
                color: Colors.white,
                size: 64,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Open Now!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                // width: 150,
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: 200,
<<<<<<< HEAD
            child: Image.asset('assets/images/saly.png'),
=======
            child: Image.asset('images/Saly.png', fit: BoxFit.cover),
>>>>>>> 3c4d468e5b19507d90d8d42577980130fedaf66e
          ),
          const Text(
            'Code Delivery!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          const Row(
            children: [
              SizedBox(
                // width: 150,
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
