import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_event.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/data/repository/my_order_repository.dart';
import 'package:pharma/models/my_order_response.dart';


class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  List<MyOrderResponse> myOrderList = [];

  MyOrderBloc() : super(MyOrderLoading()) {
    on<MyOrderEvent>((event, emit) async {
      if (event is GetMyOrder) {
        emit(MyOrderLoading());
        final response = await MyOrderRepository.getMyOrder();
        response.fold((l) {
          emit(MyOrderError(l));
        }, (r) {
          myOrderList = r;
          emit(MyOrderSuccess(r));
        });
      }
    });
  }
}
