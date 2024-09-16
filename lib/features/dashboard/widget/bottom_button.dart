import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
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


  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];


  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => _buildPageForIndex(index),
          );
        },
      ),
    );
  }


  Widget _buildPageForIndex(int index) {
    switch (index) {
      case 0:
        return Home(
          moveToCart: () {
            _onItemTapped(2);
          },
        );
      case 1:
        return ProductDetail(
          moveToCart: () {
            _onItemTapped(2);
          },
          amount: '',
          imagePath: '',
          descrition: '',
          productName: '',
          eachProduct: FinalCart(
            amount: '',
            imagePath: '',
            itemDescripton: '',
            reviews: '',
            itemCount: 0,
            id: '',
          ),
        );
      case 2:
        return const Cart();
      case 3:
        return Container(); 
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ],
      ),
      bottomNavigationBar: FlatBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
