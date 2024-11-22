import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:e_commerce_app/features/dashboard/models/product_model.dart';
import 'package:e_commerce_app/controller/services/product_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  final ProductServices productService;
  ProductBlocBloc({required this.productService})
      : super(ProductBlocInitial()) {
    on<SelectProductEvent>(_selectItem);

    on<AddProductEvent>(addProduct);
    on<FetchProductEvent>(getProduct);
  }

  FinalCart? product;

  void _selectItem(SelectProductEvent event, Emitter<ProductBlocState> emit) {
    product = event.product;
    emit(SelectProduct());
  }

  void addProduct(AddProductEvent event, Emitter<ProductBlocState> emit) async {
    emit(ProductLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      await productService.create(product: event.product);
      emit(ProductAdded());
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }

  void getProduct(
      FetchProductEvent event, Emitter<ProductBlocState> emit) async {
    emit(ProductLoading());
    try {
      final fetchedproduct = await productService.getproductData();
      emit(ProductLoaded(product: fetchedproduct));
      emit(ProductSuccessState());
    } on FirebaseException catch (e) {
      emit(ProductErrorState(error: "${e.message} with Statuscode ${e.code}"));
    }
  }
}
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
//}
