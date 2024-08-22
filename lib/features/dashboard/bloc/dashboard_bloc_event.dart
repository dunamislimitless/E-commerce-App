part of 'dashboard_bloc_bloc.dart';

@immutable
sealed class DashboardBlocEvent {}

abstract class ButtonEvent {}

class SelectButtonEvent extends ButtonEvent {
  final int index;

  SelectButtonEvent(this.index);
}
