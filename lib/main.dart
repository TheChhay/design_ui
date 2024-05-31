import 'dart:async';

import 'package:design_ui/features/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartingPage(),
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
      const Duration(milliseconds: 3000),
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
            height: 300,
            width: 300,
            child: Image.asset('assets/images/saly.png'),
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
