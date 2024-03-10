
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import '../../data/repository/my_order_repository.dart';
import 'details_order_event.dart';
import 'details_order_state.dart';

class DetailsOrderBloc extends Bloc<DetailsOrderEvent, DetailsOrderState> {


  DetailsOrderBloc() : super(DetailsOrderState()) {
    on<DetailsOrderEvent>((event, emit) async {
      if(event is GetDetailsOrder){
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await MyOrderRepository.getDetailsOrder(event.id);
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error));
        }, (r) {
          emit(state.copyWith(screenStates: ScreenStates.success,productList:r ));
        });
      }
    });
  }

}
