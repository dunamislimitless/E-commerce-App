import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
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

import '../bloc/dashboard_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.widget, this.navCallback});

  final DashboardScreen widget;
  final Function(int? toScreen)? navCallback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FinalCart> cartList = [];

  @override
  void initState() {
    super.initState();
    cartList = cart;
  }

  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtonBloc, ButtonState>(
        buildWhen: (prev, next) {
          // if (prev. != next.selectedIndex) {
          //   if (next.selectedIndex != null) {
          //     cartLnist = cart
          //         .where((e) =>
          //             e.categories ==
          //             Categories.values[
          //                 next.selectedIndex == (Categories.values.length)
          //                     ? Categories.values.length - 1
          //                     : next.selectedIndex!])
          //         .toList();
          //   }
          // }
          return true;
        },
        listener: (_, state) {},
        builder: (_, state) {
          if (state is ButtonSelectedState) {
            tab = state.index;
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
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 34.h,
                                child: ListView.builder(
                                  itemCount: Categories.values.length + 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    if (index == 0) {
                                      return IntrinsicWidth(
                                        child: IntrinsicHeight(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: tab == 0
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
                                                  AppString.all,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Inter',
                                                      color: tab == 0
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                            ).onTap(() {
                                              context
                                                  .read<ButtonBloc>()
                                                  .add(SelectButtonEvent(0));
                                            }),
                                          ),
                                        ),
                                      );
                                    }
                                    final each = Categories.values[index - 1];

                                    final isSelected = tab == index;
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
                                                each.name
                                                    .capitalizeFirstLetter(),
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
                              '${tab == 0 ? AppString.popular : Categories.values[tab - 1].name.capitalizeFirstLetter()} ${AppString.products}',
                              style: AppText.titleText,
                            ),
                            Text(
                              AppString.seeAll,
                              style: AppText.seeAll,
                            ).onTap(() async {
                              final value = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ProductCatalog(list: cartList))));

                              if (value != null) {
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                            childAspectRatio: 0.70,
                          ),
                          itemCount: cartList.length > 5 ? 6 : cartList.length,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AppIcons.star,
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 8.0.w),
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
                                          Text(AppString.view,
                                                  style: AppText.view)
                                              .onTap(() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetail(
                                                          amount: eachProduct
                                                              .amount,
                                                          imagePath: eachProduct
                                                              .imagePath,
                                                          descrition: eachProduct
                                                              .itemDescripton,
                                                          productName: eachProduct
                                                              .itemDescripton,
                                                          eachProduct:
                                                              eachProduct,
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
                              if (widget.widget.moveToCart != null)
                                widget.widget.moveToCart!();
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
        });
  }
}

// final options = [
//   OptionsContainer(data: AppString.all, onpressed: () {}),
//   OptionsContainer(data: AppString.elctronic, onpressed: () {}),
//   OptionsContainer(data: AppString.fashion, onpressed: () {}),
//   OptionsContainer(data: AppString.shoes, onpressed: () {}),
//   OptionsContainer(data: AppString.furniture, onpressed: () {}),
// ];
final cart = [
  FinalCart(
    id: "id1",
    imagePath: AppImage.headset,
    itemDescripton: 'Wireless Headphone',
    reviews: "(379)",
    amount: 65,
    itemCount: 2,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id2",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Bluetooth Speaker',
    reviews: "(249)",
    amount: 40,
    itemCount: 1,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id3",
    imagePath: AppImage.flower,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 4,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id4",
    imagePath: AppImage.flower,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 4,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id5",
    imagePath: AppImage.flower,
    itemDescripton: 'Laptop',
    reviews: "(980)",
    amount: 850,
    itemCount: 1,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id6",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Tablet',
    reviews: "(530)",
    amount: 250,
    itemCount: 3,
    categories: Categories.fashion,
  ),
  FinalCart(
    id: "id7",
    imagePath: AppImage.headset,
    itemDescripton: 'Digital Camera',
    reviews: "(412)",
    amount: 400,
    itemCount: 1,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id8",
    imagePath: AppImage.headset,
    itemDescripton: 'Smartphone',
    reviews: "(870)",
    amount: 999,
    itemCount: 1,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id9",
    imagePath: AppImage.watch,
    itemDescripton: 'Fitness Tracker',
    reviews: "(150)",
    amount: 90,
    itemCount: 2,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id10",
    imagePath: AppImage.headie,
    itemDescripton: 'Winter Jacket',
    reviews: "(320)",
    amount: 150,
    itemCount: 1,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id11",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Running Shoes',
    reviews: "(200)",
    amount: 75,
    itemCount: 2,
    categories: Categories.electronic,
  ),
  FinalCart(
    id: "id12",
    imagePath: AppImage.headset,
    itemDescripton: 'Backpack',
    reviews: "(215)",
    amount: 55,
    itemCount: 1,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id13",
    imagePath: AppImage.headie,
    itemDescripton: 'Sunglasses',
    reviews: "(135)",
    amount: 80,
    itemCount: 1,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id14",
    imagePath: AppImage.flower,
    itemDescripton: 'Mountain Bike',
    reviews: "(450)",
    amount: 500,
    itemCount: 1,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id15",
    imagePath: AppImage.watch,
    itemDescripton: 'Mechanical Keyboard',
    reviews: "(325)",
    amount: 90,
    itemCount: 2,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id16",
    imagePath: AppImage.flower,
    itemDescripton: 'Gaming Mouse',
    reviews: "(190)",
    amount: 60,
    itemCount: 2,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id17",
    imagePath: AppImage.desk,
    itemDescripton: 'Microwave Oven',
    reviews: "(600)",
    amount: 120,
    itemCount: 1,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id18",
    imagePath: AppImage.desk,
    itemDescripton: 'Vacuum Cleaner',
    reviews: "(210)",
    amount: 200,
    itemCount: 1,
    categories: Categories.furniture,
  ),
  FinalCart(
    id: "id19",
    imagePath: AppImage.desk,
    itemDescripton: 'Office Chair',
    reviews: "(360)",
    amount: 250,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id20",
    imagePath: AppImage.desk,
    itemDescripton: 'Standing Desk',
    reviews: "(420)",
    amount: 300,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id21",
    imagePath: AppImage.desk,
    itemDescripton: '4K TV',
    reviews: "(750)",
    amount: 1200,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id22",
    imagePath: AppImage.cap,
    itemDescripton: 'Coffee Maker',
    reviews: "(170)",
    amount: 100,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id23",
    imagePath: AppImage.headie,
    itemDescripton: 'Blender',
    reviews: "(310)",
    amount: 80,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id24",
    imagePath: AppImage.headset,
    itemDescripton: 'Treadmill',
    reviews: "(420)",
    amount: 850,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id25",
    imagePath: AppImage.flowerVase,
    itemDescripton: 'Electric Guitar',
    reviews: "(130)",
    amount: 600,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id26",
    imagePath: AppImage.flowerVase,
    itemDescripton: 'Drum Set',
    reviews: "(180)",
    amount: 750,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id27",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Dumbbell Set',
    reviews: "(290)",
    amount: 200,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id28",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Home Projector',
    reviews: "(230)",
    amount: 500,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id29",
    imagePath: AppImage.flowerVase,
    itemDescripton: 'Gaming Monitor',
    reviews: "(510)",
    amount: 450,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id30",
    imagePath: AppImage.flowerVase,
    itemDescripton: 'Audio Mixer',
    reviews: "(95)",
    amount: 300,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id31",
    imagePath: AppImage.flower,
    itemDescripton: 'Home Speaker',
    reviews: "(260)",
    amount: 220,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id32",
    imagePath: AppImage.watch,
    itemDescripton: 'Wi-Fi Router',
    reviews: "(370)",
    amount: 150,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id33",
    imagePath: AppImage.brownBag,
    itemDescripton: 'VR Headset',
    reviews: "(420)",
    amount: 450,
    itemCount: 1,
    categories: Categories.shoes,
  ),
  FinalCart(
    id: "id34",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Smart Fridge',
    reviews: "(590)",
    amount: 1800,
    itemCount: 1,
    categories: Categories.shoes,
  ),
];
