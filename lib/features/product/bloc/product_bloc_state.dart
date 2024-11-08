part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductBlocState {}

class ProductBlocInitial extends ProductBlocState {}

class SelectProduct extends ProductBlocState {}

class ProductAdded extends ProductBlocState {}

class ProductLoading extends ProductBlocState {}

class ProductSuccessState extends ProductBlocState {}

class ProductErrorState extends ProductBlocState {
  final String error;
  ProductErrorState({required this.error});
}
