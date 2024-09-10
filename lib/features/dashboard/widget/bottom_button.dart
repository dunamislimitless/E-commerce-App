import 'package:e_commerce_app/features/cart/view/cart.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/buttom_nav_bar.dart';
import 'package:e_commerce_app/features/product/view/product_detail.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Home(
          moveToCart: () {
            _onItemTapped(2);
          },
        ),
        const ProductDetail(
          amount: '',
          imagePath: '',
          descrition: '',
          productName: '',
        ),
        const Cart(),
        Container(),
      ][_currentIndex],
      bottomNavigationBar: FlatBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
