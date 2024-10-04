import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
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
 int? selectedIndex;

  Categories? selectedCategory;

  

  
  ButtonBloc() : super(ButtonInitialState()) {
    on<SelectButtonEvent>((event, emit) {
      if(selectedIndex == event.index){
        selectedCategory == event.
 emit(ButtonSelectedState());
      }



    

   
      
        
    });
  }


}
