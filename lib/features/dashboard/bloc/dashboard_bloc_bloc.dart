import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/category_usecase.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:meta/meta.dart';

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

// class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
//   DashboardBlocBloc() : super(DashboardBlocInitial()) {
//     on<DashboardBlocEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  // int? selectedIndex;

  Category? selectedCategory;

  ButtonBloc() : super(ButtonInitialState()) {
    on<SelectButtonEvent>(_selectButton);
  }

  void _selectButton(SelectButtonEvent event, Emitter<ButtonState> emit) {
    emit(ButtonSelectedState(index: event.index));
  }
}
