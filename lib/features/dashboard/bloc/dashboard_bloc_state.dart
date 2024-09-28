part of 'dashboard_bloc_bloc.dart';

@immutable
abstract class DashboardBlocState {}

final class DashboardBlocInitial extends DashboardBlocState {}

abstract class ButtonState {
  int? selectedIndex;

  ///TODO: Take this to the bloc
  Categories? selectedCategory;

  ///TODO: Take this to the bloc

  ButtonState({this.selectedIndex, this.selectedCategory});

  ButtonState copyWith({int? selectedIndex, Categories? selectedCategory});

  ///TODO: Unnecessary
}

class ButtonInitialState extends ButtonState {
  ButtonInitialState() : super(selectedIndex: null);

  ///TODO: Unnecessary

  @override
  ButtonInitialState copyWith(
      {int? selectedIndex, Categories? selectedCategory}) {
    ///TODO: Unnecessary
    return ButtonInitialState()
      ..selectedIndex = selectedIndex ?? this.selectedIndex
      ..selectedCategory = selectedCategory ?? this.selectedCategory;
  }
}

class ButtonSelectedState extends ButtonState {
  ButtonSelectedState({int? selectedIndex, Categories? selectedCategory})
      : super(selectedIndex: selectedIndex, selectedCategory: selectedCategory);

  ///TODO: Unnecessary

  @override
  ButtonSelectedState copyWith(
      {int? selectedIndex, Categories? selectedCategory}) {
    ///TODO: Unnecessary
    return ButtonSelectedState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
