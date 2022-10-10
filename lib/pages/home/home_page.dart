import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart/cart_history.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  List pages = [
    MainFoodPage(),
    Container(
      child: Center(child: Text("pages1")),
    ),
    CartHistory(),
    Container(
      child: Text("pages3"),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapNav,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: "archive"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "cart"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "me",
          ),
        ],
      ),
    );
  }
}
