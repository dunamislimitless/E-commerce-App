import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/dashboard/bloc/dashboard_bloc_bloc.dart';
import 'package:e_commerce_app/features/product/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cart/models/final_cart_model.dart';
import '../../cart/view/cart.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.moveToCart, this.moveToProduct});

  final VoidCallback? moveToCart;
  final VoidCallback? moveToProduct;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ButtonBloc>(create: (_) => ButtonBloc()),
          BlocProvider<DashboardBlocBloc>(create: (_) => DashboardBlocBloc())
        ],
        child: Scaffold(
          backgroundColor: AppColors.background,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: const BoxDecoration(color: AppColors.cardColor),
                child: SafeArea(
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(),
                    tabs: [
                      SvgPicture.asset(
                        AppIcons.home,
                        color: _tabController.index == 0
                            ? AppColors.discountColor
                            : null,
                      ),
                      SvgPicture.asset(
                        AppIcons.favorite,
                        color: _tabController.index == 1
                            ? AppColors.discountColor
                            : null,
                      ),
                      SvgPicture.asset(
                        AppIcons.cart,
                        color: _tabController.index == 2
                            ? AppColors.discountColor
                            : null,
                      ),
                      SvgPicture.asset(
                        AppIcons.profile,
                        color: _tabController.index == 3
                            ? AppColors.discountColor
                            : null,
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              HomeScreen(
                widget: widget,
                navCallback: (page) {
                  if (page != null) _tabController.animateTo(page);
                },
              ),
              ProductDetail(
                moveToCart: () {
                  // _onItemTapped(2);
                },
                amount: 0,
                imagePath: '',
                descrition: '',
                productName: '',
                eachProduct: FinalCart(
                  amount: 0,
                  imagePath: '',
                  itemDescripton: '',
                  reviews: '',
                  itemCount: 0,
                  id: '',
                ),
              ),
              Cart(),
              Container()
            ],
          ),
        ));
  }
}
