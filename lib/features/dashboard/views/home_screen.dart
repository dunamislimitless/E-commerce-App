import 'dart:math';

import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/mixin/toast_mixin.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/common/bloc/product/product_cubit_state.dart';
import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/features/cart/view/cart_category.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/discount_container.dart';
import 'package:e_commerce_app/features/dashboard/widget/latest_cart.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/features/product/view/all_product.dart';
import 'package:e_commerce_app/features/product/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.widget, this.navCallback});

  final DashboardScreen widget;
  final Function(int? toScreen)? navCallback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<ProductModal> cartList = [];
  List<Category> categories = [];
  List<ProductModal> products = [];

  @override
  void initState() {
    super.initState();
    // fetchCategories();

    context.read<ProductCubit>()
      ..getAllProduct()
      ..category();

    // cartList =
  }

  int tab = 0;

//  List<ProductModal> products = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(listener: (_, state) {
      if (state is ProductFailureState) {
        //TODO: Show toast for error
        Fluttertoast.showToast(
          msg: state.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0,
        );
      }
    }, builder: (context, state) {
      if (state is ProductLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is AllProductLoadedState ||
          state is CategoryLoadedState ||
          state is CategoryProductState) {
        products = state is AllProductLoadedState
            ? List.from(state.productModal)
            : this.products;

        categories = state is CategoryLoadedState
            ? List.from(state.category)
            : this.categories;

        products = state is CategoryProductState
            ? List.from(state.productModal)
            : this.products;
      }

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
                    //_buildCategorySelector(),

                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.h,
                            child: ListView.builder(
                              itemCount: categories.length + 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final isSelected = tab == index;
                                final category = index == 0
                                    ? AppString.all
                                    : categories[index - 1]
                                        .name
                                        .capitalizeFirstLetter();
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() => tab = index);
                                      debugPrint(
                                          "Data from Category of Product  HIAN !!!!!");

                                      context.read<ProductCubit>()
                                        ..productsByCategory(
                                            categoryID:
                                                categories[index - 1].id);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.discountColor
                                            : AppColors.backgroundColor,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          '${tab == 0 ? AppString.popular : categories[tab - 1].name.capitalizeFirstLetter()} ${AppString.products}',
                          style: AppText.titleText,
                        ),
                        Text(
                          AppString.seeAll,
                          style: AppText.seeAll,
                        ).onTap(() async {
                          final value = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ProductDetail())));

                          if (value != null && value is int) {
                            widget.navCallback!(value);
                          }
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
                          childAspectRatio: 0.70,
                        ),
                        itemCount: products!.length > 5 ? 6 : products.length,
                        itemBuilder: (context, index) {
                          final eachProduct = products[index];
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
                                    child: eachProduct.images.isNotEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                            child: Image.network(
                                              eachProduct.images.first
                                                  .sanitize(),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: 100.h,
                                            ),
                                          )
                                        : const Placeholder(
                                            fallbackHeight: 100,
                                            fallbackWidth: 100,
                                          ),
                                  ),
                                  Text(
                                    eachProduct.title,
                                    style: AppText.itemText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2.0.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppIcons.star,
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0.w),
                                          child: Text(
                                            "200",
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
                                          '\$${eachProduct.price}',
                                          style: AppText.amountText,
                                        ),
                                        Text(AppString.view,
                                            style: AppText.view)
                                        //   .onTap(() {
                                        // context
                                        //     .read<ProductBlocBloc>()
                                        //     .add(SelectProductEvent(
                                        //         product: eachProduct));
                                        // widget.navCallback!(1);

                                        // })
                                      ]),
                                ],
                              ),
                            ),
                          );
                          // .onTap(() {
                          //   context
                          //       .read<CartBloc>()
                          //       .add(AddItemEvent(item: eachProduct));
                          //   if (widget.widget.moveToCart != null)
                          //     widget.widget.moveToCart!();
                          // });
                        }),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.lp,
                          style: AppText.titleText,
                        ),
                        Text(
                          AppString.addProduct,
                          style: AppText.seeAll,
                        ).onTap(() {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => AddProduct());
                          //
                          //
                        })
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
    });
  }

  Widget _buildCategorySelector() {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProductFailureState) {
        return Text(state.errorMessage);
      }
      if (state is CategoryLoadedState) {
        categories = List.from(state.category);

        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 34.h,
                child: ListView.builder(
                  itemCount: categories.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final isSelected = tab == index;
                    final category = index == 0
                        ? AppString.all
                        : categories[index - 1].name.capitalizeFirstLetter();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => tab = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.discountColor
                                : AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }
      return SizedBox.shrink();
    });
  }
}
