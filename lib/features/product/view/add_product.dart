import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';
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
  File? image;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker picker = ImagePicker();
  final productNameController = TextEditingController();

  final productDescriptionController = TextEditingController();

  final priceController = TextEditingController();

  void dispose() {
    priceController.dispose();
    productDescriptionController.dispose();
    productNameController.dispose();
    super.dispose();
  }

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

  Future uploadProductDetails() async {
    if (image == null) return;
    final fileName = basename(image!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(image!);

      final imageUrl = await ref.getDownloadURL();
      num? productPrice;
      try {
        productPrice = int.parse(priceController.text);
      } catch (e) {
        print('Invalid price input. Please enter a valid number.');
        return;
      }

      await _firestore.collection('images').add({
        'product_name': productNameController.text,
        'product_description': productDescriptionController.text,
        'imageUrl': imageUrl,
        'product_price': productPrice,
        'uploadDate': FieldValue.serverTimestamp(),
      });

      print("product added SUCCESSFULLY!!!!   656565");
    } catch (e) {
      print('ERROR  OCCURED');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              CustomButton(
                onPressed: uploadProductDetails,
                height: 52,
                textColor: AppColors.discountColor,
                buttontext: 'Update Product',
              )
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
