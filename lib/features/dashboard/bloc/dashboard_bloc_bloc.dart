import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBlocBloc() : super(DashboardBlocInitial()) {
    on<DashboardBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitialState()) {
    on<SelectButtonEvent>((event, emit) {
      emit(ButtonSelectedState(selectedIndex: event.index));
    });
  }
}
