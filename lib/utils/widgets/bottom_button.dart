import 'package:e_commerce_app/utils/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/app/features/cart/view/cart.dart';
import 'package:e_commerce_app/app/features/cart/view/cart_category.dart';
import 'package:e_commerce_app/app/features/product/view/product_detail.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const ProductDetail(),
    Cart(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: FlatBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
