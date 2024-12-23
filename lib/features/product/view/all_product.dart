import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/common/bloc/product/product_cubit_state.dart';
import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({super.key, this.moveToCart});

  final VoidCallback? moveToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocProvider(
        create: (context) => ProductCubit()..getAllProduct(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductFailureState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final snackBar = SnackBar(content: Text(state.errorMessage));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
              return const Center(child: Text("Failed to load products"));
            }
            if (state is AllProductLoadedState) {
              final fetchedProducts = state.productModal;

              return Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    PageHeader(
                      title: AppString.products,
                      trailing: AppIcons.cartLoaded.onTap(() {
                        Navigator.pop(context, 2);
                      }),
                      leading: AppIcons.arrowBack.onTap(() {
                        Navigator.pop(context);
                      }),
                    ),
                    SizedBox(height: 30.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 0.7,
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: fetchedProducts.length,
                        itemBuilder: (context, index) {
                          final each = fetchedProducts[index];
                          return Container(
                            height: 268.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
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
                                    child: each.images.isNotEmpty
                                        ? CarouselSlider(
                                            options: CarouselOptions(
                                              height: 100.h,
                                              viewportFraction: 1.0,
                                              enableInfiniteScroll: true,
                                              autoPlay: true,
                                            ),
                                            items: each.images.map((imageUrl) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                                child: Image.network(
                                                  imageUrl,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                              );
                                            }).toList(),
                                          )
                                        : const Placeholder(
                                            fallbackHeight: 100,
                                            fallbackWidth: 100,
                                          ),
                                  ),
                                  Text(
                                    each.description,
                                    style: AppText.itemText,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2.0.h),
                                    child: Row(
                                      children: [
                                        AppIcons.star,
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0.w),
                                          child: Text(
                                            "200",
                                            style: AppText.reviewText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${each.price}',
                                        style: AppText.amountText,
                                      ),
                                      Text(AppString.view, style: AppText.view),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ).onTap(() {
                            context
                                .read<CartBloc>()
                                .add(AddItemEvent(item: each));
                            if (moveToCart != null) moveToCart!();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox
                .shrink(); // Handles unexpected states gracefully
          },
        ),
      ),
    );
  }
}
