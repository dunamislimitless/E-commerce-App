part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductBlocState {}

class ProductBlocInitial extends ProductBlocState {}

class SelectProduct extends ProductBlocState {}
