import 'dart:io';

import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Categories? selectedCategories;
  File? image;
  final ImagePicker picker = ImagePicker();
  final productNameController = TextEditingController();

  final productDescriptionController = TextEditingController();
  final categoriesController = TextEditingController();
  final countController = TextEditingController();
  final reviewController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();

  void dispose() {
    priceController.dispose();
    productDescriptionController.dispose();
    productNameController.dispose();
    countController.dispose();
    reviewController.dispose();
    ratingController.dispose();
    categoriesController.dispose();
    super.dispose();
  }

  Future<void> createProduct() async {}

  void postData(context) {}

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadProductDetails() async {}

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBlocBloc>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add Product')),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(children: [
              SizedBox(height: 20.h),
              CustomLabeledInput(
                title: 'Product Name',
                label: 'Enter Product Name',
                prefixIcon: Icons.military_tech_rounded,
                controller: productNameController,
              ),
              CustomLabeledInput(
                title: 'Product Description',
                label: 'Enter Product Description',
                prefixIcon: Icons.abc_outlined,
                controller: productDescriptionController,
              ),
              CustomLabeledInput(
                title: 'Price',
                label: 'Enter Product Price',
                prefixIcon: Icons.money,
                keyboardType: TextInputType.number,
                controller: priceController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              // CustomLabeledInput(
              //   title: 'Price',
              //   label: 'Enter Product Price',
              //   prefixIcon: Icons.money,
              //   keyboardType: TextInputType.number,
              //   controller: priceController,
              //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              // ),
              CustomLabeledInput(
                title: "Review",
                label: 'Enter Product review',
                prefixIcon: Icons.money,
                keyboardType: TextInputType.number,
                controller: reviewController,
              ),
              Center(
                child: DropdownButton<Categories>(
                  value: selectedCategories,
                  items: Categories.values.map((Categories categories) {
                    return DropdownMenuItem<Categories>(
                      value: categories,
                      child:
                          Text(categories.name.toUpperCase()), // Display name
                    );
                  }).toList(),
                  onChanged: (Categories? newValue) {
                    setState(() {
                      selectedCategories = newValue!;
                      categoriesController.text = newValue.name;
                    });
                  },
                ),
              ),
              CustomLabeledInput(
                title: "Enter how many Product you want",
                label: '0',
                prefixIcon: Icons.money,
                keyboardType: TextInputType.number,
                controller: countController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 20,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print("Na Ratimg Be This $rating");
                  ratingController.text = "$rating";
                },
              ),
              CustomButton(
                onPressed: () {},
                height: 52,
                textColor: AppColors.lightButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.discountColor,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(AppString.addImage)
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<ProductBlocBloc, ProductBlocState>(
                  listener: (context, state) {
                if (state is ProductSuccessState) {
                } else if (state is ProductErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              }, builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                return CustomButton(
                  onPressed: () async {
                    // if (image == null) return;
                    // final fileName = basename(image!.path);
                    // final destination = 'files/$fileName';

                    try {
                      // final ref = firebase_storage.FirebaseStorage.instance
                      //     .ref(destination)
                      //     .child('file/');
                      // await ref.putFile(image!);

                      // final imageUrl = await ref.getDownloadURL();

                      productBloc.add(AddProductEvent(
                          product: FinalCart(
                        amount: num.parse(priceController.text),
                        id: "",
                        imagePath: "imageUrl",
                        itemCount: num.parse(countController.text),
                        itemDescription: productDescriptionController.text,
                        reviews: ratingController.text,
                      )));
                      debugPrint('DONezDDDDD');
                    } catch (e) {
                      debugPrint('ERROR  OCCURED');
                    }
                  },
                  height: 52,
                  textColor: AppColors.discountColor,
                  buttontext: 'Update Product',
                );
              })
            ]),
          ),
        ),
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
