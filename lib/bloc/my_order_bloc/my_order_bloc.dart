import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_event.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/my_order_repository.dart';
import 'package:pharma/models/basket_model.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/models/product_response.dart';

import '../../data/data_resource/local_resource/data_store.dart';
import '../../data/data_resource/local_resource/datastore_keys.dart';
import '../../data/repository/basket_repo.dart';


class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  List<MyOrderResponse> myOrderList = [];
  List<ProductResponse> productDetailsList=[];
   List<ProductResponse> productDetailsListFinal=[];
  int sum = 0;
  late TabController tabController;
  BasketModel basketModelStore =
      DataStore.instance.dynamicData<BasketModel>(DataStoreKeys.basket) ??
          BasketModel(basketList: []);
  int countsProducts(int id, int idBasket) {
    if (productDetailsList.any((element) => element.id == id)) {
      int index = productDetailsList.indexWhere((element) => element.id == id);
      print("productDetailsListPending[index].quantity");
      print(productDetailsListFinal[index].quantity);
      print(productDetailsList[index].quantity);
      int indexBasket = basketModelStore.basketList.indexWhere((element) => element.id == idBasket);
      if (indexBasket != -1) { // التحقق مما إذا كان السلة غير فارغة
        int indexProduct = basketModelStore.basketList[indexBasket].products.indexWhere((element) => element.productId == id);
        if (indexProduct != -1) { // التحقق مما إذا كان المنتج موجود في السلة
          int quantityInBasket = basketModelStore.basketList[indexBasket].products[indexProduct].quantity;
          int availableQuantity = productDetailsListFinal[index].quantity ?? 0;
          if (quantityInBasket <= availableQuantity) { // التحقق مما إذا كانت الكمية في السلة أقل من الكمية المتاحة للمنتج
            productDetailsList[index].quantity = quantityInBasket;
            return quantityInBasket;
          } else {
            return availableQuantity;
          }
        }
      }
    }
    return 0;
  }
  int finalPrice(){
    int totalTax=0;
    int totalProduct=0;
    for (int i = 0; i < productDetailsList.length; i++) {
      totalTax+=productDetailsList[i].tax??0;
      totalProduct += (int.parse(productDetailsList[i].price??"0") * productDetailsList[i].quantity!);
    }
    sum=totalProduct+totalTax;
    return sum;
  }
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
               basketModel:basketModelStore));
            break;

          default:
            break;
        }

      }
      if(event is DeleteBasket){
        state.basketModel.basketList.removeWhere((element) => element.id == event.idBasket);
        DataStore.instance.setDynamicData(DataStoreKeys.basket, basketModelStore);
        emit(state.copyWith(
            basketModel:basketModelStore,check: !state.check));

      }
      if (event is ShowBasket) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        List<int> listIdProduct=[];

        for (var element in event.idProducts) {
          listIdProduct.add(element.productId);
        }
        final response = await MyOrderRepository.showBasket(listIdProduct);
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error,error:l));
        }, (r) {
          productDetailsList=r;
          productDetailsListFinal=productDetailsList;

          emit(state.copyWith(screenStates: ScreenStates.success,productList: r,totalPrice: finalPrice(),productListp: r));
        });
      }
      if (event is AddCountOrder) {
        int index = productDetailsList.indexWhere((element) => element.id == event.id);
        int index1 = productDetailsListFinal.indexWhere((element) => element.id == event.id);

        if (index != -1) { // التحقق مما إذا كان المنتج موجود في القائمة
        if (productDetailsList[index].quantity != null) {
          productDetailsList[index].quantity = productDetailsList[index].quantity! + 1;
        } else {
          productDetailsList[index].quantity = 1; // في حالة عدم وجود كمية محددة مسبقًا
        }
        sum = 0;
        // إعادة تهيئة المجموع
        emit(
          state.copyWith(
            productList: productDetailsList,
            totalPrice: finalPrice(),
          ),
        );
      }}
      if (event is MinusCountOrder) {
        int index1 =
        productDetailsList.indexWhere((element) => element.id == event.id);
        if (productDetailsList[index1].quantity != 0) {
          productDetailsList[index1].quantity =
              productDetailsList[index1].quantity! - 1;
        }
        sum=0;
        emit(
          state.copyWith(
              productList: productDetailsList,
              totalPrice: finalPrice()
          ),
        );
      }
      if (event is PaymentProcessBasket) {
       emit(state.copyWith(isLoadingConfirm: true));

        (await BasketRepo.getPaymentDetailBasket(productDetailsList)).fold(
              (l) => emit(
              state.copyWith(error: l)),
              (r)  {
                state.basketModel.basketList.removeWhere((element) => element.id == event.id);
                DataStore.instance.setDynamicData(DataStoreKeys.basket, basketModelStore);
              emit(
              state.copyWith(
              paymentProcessResponse: r,
              successConfirm: true,
                  basketModel:basketModelStore,check: !state.check
              ),
              );}
        );
      }
      if (event is DeleteProductOrder) {
        productDetailsList.removeWhere((element) => element.id == event.id);
        sum=0;
        emit(state.copyWith(
            productList: productDetailsList,
            totalPrice:  finalPrice()
        ));
      }
    });
  }
}
