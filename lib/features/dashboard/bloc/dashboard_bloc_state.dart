

part of 'dashboard_bloc_bloc.dart';

@immutable
abstract class DashboardBlocState {}


final class DashboardBlocInitial extends DashboardBlocState {}

abstract class ButtonState {
  int? selectedIndex;
  Categories? selectedCategory;

  ButtonState({this.selectedIndex, this.selectedCategory});
  
  ButtonState copyWith({int? selectedIndex, Categories? selectedCategory});
}

class ButtonInitialState extends ButtonState {
  ButtonInitialState() : super(selectedIndex: null);

  @override
  ButtonInitialState copyWith({int? selectedIndex, Categories? selectedCategory}) {
    return ButtonInitialState()
      ..selectedIndex = selectedIndex ?? this.selectedIndex
      ..selectedCategory = selectedCategory ?? this.selectedCategory;
  }
}

class ButtonSelectedState extends ButtonState {
  ButtonSelectedState({ int? selectedIndex, Categories? selectedCategory})
      : super(selectedIndex: selectedIndex, selectedCategory: selectedCategory);

  @override
  ButtonSelectedState copyWith({int? selectedIndex, Categories? selectedCategory}) {
    return ButtonSelectedState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
