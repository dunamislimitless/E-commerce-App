import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/all_product.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/category_usecase.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/product_usecase.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';

import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState());

  void getAllProduct() async {
    var result = await s1<GetProductUsecase>().call();

    if (result != null) {
      emit(AllProductLoadedState(productModal: result));
    } else {
      emit(ProductFailureState(errorMessage: 'Failed to load data'));
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
