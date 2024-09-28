// import 'package:e_commerce_app/app/utils/appicons.dart';
// import 'package:e_commerce_app/app/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FlatBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const FlatBottomNavBar(
//       {super.key, required this.currentIndex, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 16.w,
//       ),
//       child: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: onTap,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.discountColor,
//         unselectedItemColor: AppColors.reviewColor,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_sharp),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
