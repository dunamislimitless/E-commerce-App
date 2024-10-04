part of 'dashboard_bloc_bloc.dart';

// @immutable
// abstract class DashboardBlocState {}
//
// final class DashboardBlocInitial extends DashboardBlocState {}

abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonSelectedState extends ButtonState {
  final int index;

  ButtonSelectedState({required this.index});
}
