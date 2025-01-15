import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/app/utils/mixin/toast_mixin.dart';
import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/category_usecase.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> with ToastMixin {
  ProductCubit({required this.productRepository})
      : super(ProductLoadingState());

  final ProductRepository productRepository;

  void getAllProduct() async {
    var result = await productRepository.getProduct();

    if (result.list != null) {
      emit(AllProductLoadedState(productModal: result.list ?? []));
    } else {
      emit(ProductFailureState(errorMessage: result.error ?? ""));
    }
  }

  void getEachProduct() async {
    var result = await productRepository.getEachProduct();

    if (result.product != null) {
      emit(ProductLoadedState(producttModal: result.product));
    } else {
      emit(ProductFailureState(errorMessage: result.error ?? ""));
    }
  }

  void category() async {
    var result = await productRepository.getCategory();

    if (result.list != null) {
      emit(CategoryLoadedState(category: result.list ?? []));
    } else {
      emit(ProductFailureState(
          errorMessage: result.error ?? 'Failed to load data'));
    }
  }

  void productsByCategory({int? categoryID}) async {
    var result = await productRepository.getProductsByCategory(id: categoryID);

    if (result.list != null) {
      emit(CategoryProductState(productModal: result.list ?? []));
    } else {
      emit(ProductFailureState(
          errorMessage: result.error ?? 'Failed to load data'));
    }
  }
}
