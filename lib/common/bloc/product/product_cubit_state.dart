import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/get_user.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_dislay_state.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubitState extends Cubit<ProductState> {
  ProductCubitState() : super(ProductLoadingState());

  void displayUser() async {
    var result = await s1<GetUserUseCase>().call();

    result.fold((error) {
      emit(ProductFailureState(errorMessage: error));
    }, (data) {
      emit(AllProductLoadedState(productEntity: data));
    });
  }
}
