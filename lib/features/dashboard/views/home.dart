import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/view/cart_category.dart';
import 'package:e_commerce_app/features/dashboard/bloc/dashboard_bloc_bloc.dart';
import 'package:e_commerce_app/features/dashboard/models/options_model.dart';
import 'package:e_commerce_app/features/dashboard/widget/discount_container.dart';
import 'package:e_commerce_app/features/dashboard/widget/latest_cart.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/features/product/view/all_product.dart';
import 'package:e_commerce_app/features/product/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cart/cart_bloc/cart_event.dart';
import '../../cart/models/final_cart_model.dart';
import '../../cart/view/cart.dart';

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
                    onTap: (a) => setState(() {}),
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
              HomeScreen(widget: widget),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.widget,
  });

  final DashboardScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          PageHeader(
              title: AppString.home,
              trailing: AppIcons.search.onTap(() {}),
              leading: AppIcons.menu.onTap(() {})),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const DiscountContaieer(
                    discountPercent: '30%',
                    item: 'home decoration products',
                    imagepath: AppImage.flowerVase,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.category,
                        style: AppText.titleText,
                      ),
                      Text(
                        AppString.seeAll,
                        style: AppText.seeAll,
                      ).onTap(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartCategory()));
                      })
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 34.h,
                          child: ListView.builder(
                            itemCount: options.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              final each = options[index];

                              return BlocConsumer<ButtonBloc, ButtonState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  final isSelected =
                                      state.selectedIndex == index;
                                  return IntrinsicWidth(
                                    child: IntrinsicHeight(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? AppColors.discountColor
                                                : AppColors.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(6.sp),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.w,
                                                right: 12.w,
                                                top: 6.h,
                                                bottom: 6.h),
                                            child: Text(
                                              each.data,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter',
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        ).onTap(() {
                                          context
                                              .read<ButtonBloc>()
                                              .add(SelectButtonEvent(index));
                                        }),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.popularProduct,
                        style: AppText.titleText,
                      ),
                      Text(
                        AppString.seeAll,
                        style: AppText.seeAll,
                      ).onTap(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProductCatalog())));
                      })
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                      // childAspectRatio: 0.70,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final eachProduct = cart[index];
                      return Container(
                        height: 268.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AppIcons.favoriteGray,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Image.asset(eachProduct.imagePath),
                              ),
                              Text(
                                eachProduct.itemDescripton,
                                style: AppText.itemText,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppIcons.star,
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0.w),
                                      child: Text(
                                        eachProduct.reviews,
                                        style: AppText.reviewText,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${eachProduct.amount}',
                                      style: AppText.amountText,
                                    ),
                                    Text(AppString.view, style: AppText.view)
                                        .onTap(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                    amount: eachProduct.amount,
                                                    imagePath:
                                                        eachProduct.imagePath,
                                                    descrition: eachProduct
                                                        .itemDescripton,
                                                    productName: eachProduct
                                                        .itemDescripton,
                                                    eachProduct: eachProduct,
                                                  )));
                                    })
                                  ]),
                            ],
                          ),
                        ),
                      ).onTap(() {
                        context
                            .read<CartBloc>()
                            .add(AddItemEvent(item: eachProduct));
                        if (widget.moveToCart != null) widget.moveToCart!();
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.lp,
                        style: AppText.titleText,
                      ),
                      Text(
                        AppString.seeAll,
                        style: AppText.seeAll,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const LatestCart(
                      imagePath: AppImage.headie,
                      itemDescription: 'Headphone Holder',
                      reviews: '(1446)',
                      amount: '\$34.90'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

final options = [
  OptionsContainer(data: AppString.all),
  OptionsContainer(data: AppString.elctronic),
  OptionsContainer(data: AppString.fashion),
  OptionsContainer(data: AppString.shoes),
  OptionsContainer(data: AppString.furniture),
];
final cart = [
  FinalCart(
    id: "id1",
    imagePath: AppImage.headset,
    itemDescripton: 'Wireless Headphone',
    reviews: "(379)",
    amount: 65,
    itemCount: 2,
  ),
  FinalCart(
    id: "id2",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Bluetooth Speaker',
    reviews: "(249)",
    amount: 40,
    itemCount: 1,
  ),
  FinalCart(
    id: "id3",
    imagePath: AppImage.flower,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 4,
  ),
  FinalCart(
    id: "id4",
    imagePath: AppImage.flower,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 4,
  ),
];
