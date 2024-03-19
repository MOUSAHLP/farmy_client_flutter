import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_event.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/my_order_repository.dart';
import 'package:pharma/models/basket_model.dart';
import 'package:pharma/models/my_order_response.dart';

import '../../data/data_resource/local_resource/data_store.dart';
import '../../data/data_resource/local_resource/datastore_keys.dart';


class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  List<MyOrderResponse> myOrderList = [];
  late TabController tabController;
  MyOrderBloc() : super(MyOrderState(basketModel: BasketModel(basketList: []))) {
    on<MyOrderEvent>((event, emit) async {
      if (event is GetMyOrder) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await MyOrderRepository.getMyOrder();
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error,error:l));

        }, (r) {
          myOrderList=r;
          emit(state.copyWith(screenStates: ScreenStates.success,myOrderList: r));

        });
      }
      if (event is DeleteOrder) {
        emit(state.copyWith(isLoadingDelete: true));
        final response = await MyOrderRepository.deleteOrder(event.id);
        response.fold((l) {
          emit(state.copyWith(errorDelete: l,isErrorDelete: true));
        }, (r) {

          emit(state.copyWith(successDelete: true));
        });
      }
      if (event is TapOnPressed) {
        int index = event.index;
        switch (index) {
          case 0:
            tabController.animateTo(index);
            emit(state.copyWith(
                indexTap:index,
                myOrderList: myOrderList));
            break;
          case 1:
            tabController.animateTo(index);
            emit(state.copyWith(
        indexTap:index,
               basketModel: DataStore.instance.dynamicData<BasketModel>(DataStoreKeys.basket) ??
                   BasketModel(basketList: [])));
            break;

          default:
            break;
        }

      }
    });
  }
}
