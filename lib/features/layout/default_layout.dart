import 'package:design_ui/features/history/history_page.dart';
import 'package:design_ui/features/home/home_page.dart';
import 'package:design_ui/features/order/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  List<Widget> pages = [
    const HomePage(),
    OrderPage(),
    const HistoryPage(),
  ];
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexPage],
      bottomNavigationBar: Container(
        height: 60,
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.yellow,
          padding: const EdgeInsets.all(8),
          onTabChange: (index) {
            setState(() {
              indexPage = index;
            });
          },
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.production_quantity_limits_outlined,
              text: 'Order',
            ),
            GButton(
              icon: Icons.history_rounded,
              text: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
