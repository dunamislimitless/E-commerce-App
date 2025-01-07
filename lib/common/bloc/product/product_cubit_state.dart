import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/category_usecase.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/product_usecase.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
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

  void getEachProduct({dynamic params, required UseCase usecase}) async {
    try {
      Either result = await s1<SingleItemUseCase>().call();
      result.fold((error) {
        emit(ProductFailureState(errorMessage: error));
      }, (data) {
        emit(AllProductLoadedState(productModal: data));
      });
    } catch (e) {
      emit(ProductFailureState(errorMessage: e.toString()));
    }
  }

  void category() async {
    var result = await s1<GetCaregoryUsecase>().call();

    if (result != null) {
      emit(CategoryLoadedState(category: result));
    } else {
      emit(ProductFailureState(errorMessage: 'Failed to load data'));
    }
  }
}
