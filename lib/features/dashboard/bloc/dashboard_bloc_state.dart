part of 'dashboard_bloc_bloc.dart';

@immutable
class DashboardBlocState {}

final class DashboardBlocInitial extends DashboardBlocState {}

abstract class ButtonState {
  final int? selectedIndex;
  ButtonState({this.selectedIndex});
}

class ButtonInitialState extends ButtonState {
  ButtonInitialState() : super(selectedIndex: null);
}

class ButtonSelectedState extends ButtonState {
  ButtonSelectedState({required int selectedIndex})
      : super(selectedIndex: selectedIndex);
}
