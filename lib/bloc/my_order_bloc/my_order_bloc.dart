import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_event.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/my_order_repository.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/models/basket_model.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/models/params/product_model.dart';
import 'package:pharma/models/product_response.dart';
import '../../data/data_resource/local_resource/data_store.dart';
import '../../data/data_resource/local_resource/datastore_keys.dart';
import '../../data/repository/basket_repo.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  List<MyOrderResponse> myOrderList = [];
  List<ProductResponse> productDetailsList = [];
  List<Product> productInBasketList = [];
  List<ProductResponse> productDetailsListFinal = [];
  int sum = 0;
  late TabController tabController;
  BasketModel basketModelStore =
      DataStore.instance.dynamicData<BasketModel>(DataStoreKeys.basket) ??
          BasketModel(basketList: []);

  int finalPrice() {
    double totalTax = 0;
    int totalProduct = 0;
    for (int i = 0; i < productDetailsList.length; i++) {
      int reversedIndex = productInBasketList.length - 1 - i;

      // totalTax += (productDetailsList[i].tax ?? 0 *  int.parse(productDetailsList[i].discountPrice ?? "0"))/100;

      if (productDetailsList[i].discountStatus == "1") {
        totalProduct += (int.parse(productDetailsList[i].discountPrice ?? "0") *
            productInBasketList[i].quantity);

        totalTax += ((productDetailsList[i].tax ?? 0) / 100) *
            (int.parse(productDetailsList[i].discountPrice ?? "0") *
                productInBasketList[i].quantity);
      } else {
        totalProduct += (int.parse(productDetailsList[i].price ?? "0") *
            productInBasketList[i].quantity);

        totalTax += ((productDetailsList[i].tax ?? 0) / 100) *
            (int.parse(productDetailsList[i].price ?? "0") *
                productInBasketList[i].quantity);
      }
    }
    sum = totalProduct + totalTax.toInt();
    return sum;
  }

  MyOrderBloc()
      : super(
          MyOrderState(
            basketModel: BasketModel(
              basketList: [],
            ),
          ),
        ) {
    on<MyOrderEvent>((event, emit) async {
      if (event is GetMyOrder) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await MyOrderRepository.getMyOrder();
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error, error: l));
        }, (r) {
          myOrderList = r;
          emit(state.copyWith(
              screenStates: ScreenStates.success, myOrderList: r));
        });
      }
      if (event is DeleteOrder) {
        emit(state.copyWith(isLoadingDelete: true));
        final response = await MyOrderRepository.deleteOrder(event.id);
        response.fold((l) {
          emit(state.copyWith(errorDelete: l, isErrorDelete: true));
        }, (r) {
          emit(state.copyWith(successDelete: true));
        });
      }
      if (event is TapOnPressed) {
        int index = event.index;
        switch (index) {
          case 0:
            tabController.animateTo(index);
            emit(state.copyWith(indexTap: index, myOrderList: myOrderList));
            break;
          case 1:
            tabController.animateTo(index);

            if (!state.isCartPricesFetched) {
              emit(state.copyWith(screenStates: ScreenStates.loading));
              final response = await MyOrderRepository.getCartPrices(
                  basketModelStore.basketList);
              response.fold(
                (l) {
                  emit(state.copyWith(
                      screenStates: ScreenStates.error, error: l));
                },
                (r) {
                  for (var e in basketModelStore.basketList) {
                    e.price = r["${e.id}"] ?? 0;
                  }

                  emit(state.copyWith(
                      indexTap: index,
                      basketModel: basketModelStore,
                      isCartPricesFetched: true,
                      screenStates: ScreenStates.success));
                },
              );
            }

            break;
          default:
            break;
        }
      }
      if (event is DeleteBasket) {
        state.basketModel.basketList
            .removeWhere((element) => element.id == event.idBasket);
        DataStore.instance
            .setDynamicData(DataStoreKeys.basket, basketModelStore);
        emit(
            state.copyWith(basketModel: basketModelStore, check: !state.check));
      }
      if (event is ShowBasket) {
        for (var product in basketModelStore.basketList.reversed
            .firstWhere((element) => element.id == event.idBasket)
            .products) {
          productInBasketList.add(product);
        }
        productInBasketList.sort((a, b) => a.productId.compareTo(b.productId));
        emit(state.copyWith(screenStates: ScreenStates.loading));
        List<int> listIdProduct = [];

        for (var element in event.idProducts) {
          listIdProduct.add(element.productId);
        }
        final response = await MyOrderRepository.showBasket(listIdProduct);
        response.fold(
          (l) {
            emit(state.copyWith(screenStates: ScreenStates.error, error: l));
          },
          (r) {
            productDetailsList = r;
            productDetailsListFinal = productDetailsList;

            emit(
              state.copyWith(
                screenStates: ScreenStates.success,
                productList: r,
                totalPrice: finalPrice(),
                productListp: r,
                quantityInBasket: productInBasketList.toList(),
              ),
            );
          },
        );
      }
      if (event is AddCountOrder) {
        if (productInBasketList
            .any((element) => element.productId == event.id)) {
          int indexProductInBasketList = productInBasketList
              .indexWhere((element) => element.productId == event.id);

          int indexProductDetailsList = productDetailsList
              .indexWhere((element) => element.id == event.id);

          if (productInBasketList[indexProductInBasketList].quantity <
              productDetailsList[indexProductDetailsList].quantity!) {
            productInBasketList[indexProductInBasketList].quantity++;
          }
        }
        emit(
          state.copyWith(
            productList: productDetailsList,
            totalPrice: finalPrice(),
            quantityInBasket: productInBasketList.toList(),
          ),
        );
      }
      if (event is MinusCountOrder) {
        if (productInBasketList
            .any((element) => element.productId == event.id)) {
          int indexProductInBasketList = productInBasketList
              .indexWhere((element) => element.productId == event.id);

          int indexProductDetailsList = productDetailsList
              .indexWhere((element) => element.id == event.id);

          if (productInBasketList[indexProductInBasketList].quantity != 0) {
            productInBasketList[indexProductInBasketList].quantity--;
          }
        }
        emit(
          state.copyWith(
            productList: productDetailsList,
            totalPrice: finalPrice(),
            quantityInBasket: productInBasketList.toList(),
          ),
        );
      }
      if (event is PaymentProcessBasket) {
        emit(state.copyWith(isLoadingConfirm: true));
        for (var productInBasket in state.quantityInBasket) {
          if (productDetailsList
              .any((element) => element.id == productInBasket.productId)) {
            int indexProductDetailsList = productDetailsList.indexWhere(
                (element) => element.id == productInBasket.productId);

            int indexProductInBasketList = productInBasketList.indexWhere(
                (element) =>
                    element.productId ==
                    productDetailsList[indexProductDetailsList].id);

            productDetailsList[indexProductDetailsList].quantity =
                productInBasket.quantity;
          }
        }
        var res = await PaymentRepo.getRewardCouponFixedValue();
        res.fold(
          (l) => null,
          (r) => emit(
            state.copyWith(
              rewardCouponsFixedValueModel: r,
            ),
          ),
        );

        var response =
            await BasketRepo.getPaymentDetailBasket(productDetailsList);
        response.fold(
          (l) => emit(
            state.copyWith(error: l),
          ),
          (r) {
            emit(
              state.copyWith(
                paymentProcessResponse: r,
                successConfirm: true,
                basketModel: basketModelStore,
                check: !state.check,
              ),
            );
          },
        );
      }
      if (event is DeleteProductOrder) {
        productDetailsList.removeWhere((element) => element.id == event.id);
        sum = 0;
        emit(state.copyWith(
            productList: productDetailsList, totalPrice: finalPrice()));
      }
      if (event is GetOrderHistory) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        print("000000000000000000000");
        final response = await MyOrderRepository.getMyOrderHistory();
        print("11111111111111111111");
        response.fold((l) {
          print("22222222222222222");
          emit(
            state.copyWith(screenStates: ScreenStates.error, error: l),
          );
        }, (r) {
          myOrderList = r;
          emit(
            state.copyWith(
              screenStates: ScreenStates.success,
              myOrderHistoryList: r,
            ),
          );
        });
      }

      if (event is ChangStateToSuccessConfirm) {
        emit(state.copyWith(successConfirm: true));
      }
    });
  }
}
