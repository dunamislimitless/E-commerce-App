// import 'dart:io';

// import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
// import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
// import 'package:e_commerce_app/features/dashboard/models/product_model.dart';
// import 'package:e_commerce_app/controller/services/product_services.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart';

// part 'product_bloc_event.dart';
// part 'product_bloc_state.dart';

// class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
//   ProductServices productService = ProductServices();
//   ProductBlocBloc() : super(ProductBlocInitial()) {
//     on<SelectProductEvent>(_selectItem);

//     on<AddProductEvent>(addProduct);
//     // on<FetchProductEvent>(getProduct as EventHandler<FetchProductEvent, ProductBlocState>);
//   }

//   ProductModal? product;

//   void _selectItem(SelectProductEvent event, Emitter<ProductBlocState> emit) {
//     product = event.product;
//     emit(SelectProduct());
//   }

//   void addProduct(AddProductEvent event, Emitter<ProductBlocState> emit) async {
//     emit(ProductLoading());
//     await Future.delayed(Duration(seconds: 1));
//     try {
//       // await productService.create(product: event.product);
//       emit(ProductAdded());
//     } catch (e) {
//       emit(ProductErrorState(error: e.toString()));
//     }
//   }

//   Future<List<FinalCart>> getProduct() async {
//     try {
//       final fetchedproduct = await productService.getproductData();
//       debugPrint("Normal FGSSDQ $fetchedproduct");
//       return fetchedproduct;
//     } catch (e) {
//       print('ERROR: $e');
//     }
//     return [];
//   }

//   void addAllProduct(List<FinalCart> cart) async {
//     await productService.uploadCartItems(cart);
//   }
// }

// firebase_storage.FirebaseStorage storage =
//     firebase_storage.FirebaseStorage.instance;

// File? _photo;
// final ImagePicker _picker = ImagePicker();

// Future imgFromGallery() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     _photo = File(pickedFile.path);
//     uploadFile();
//   } else {
//     print('No image selected.');
//   }
// }

// Future imgFromCamera() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//   if (pickedFile != null) {
//     _photo = File(pickedFile.path);
//     uploadFile();
//   } else {
//     print('No image selected.');
//   }
// }

// Future uploadFile() async {
//   if (_photo == null) return;
//   final fileName = basename(_photo!.path);
//   final destination = 'files/$fileName';

//   try {
//     final ref = firebase_storage.FirebaseStorage.instance
//         .ref(destination)
//         .child('file/');
//     await ref.putFile(_photo!);
//   } catch (e) {
//     print('error occured');
//   }
// }

// void fetchProduct() async {}
