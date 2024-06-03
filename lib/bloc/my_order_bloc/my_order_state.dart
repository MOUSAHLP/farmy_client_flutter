import 'package:equatable/equatable.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/models/params/product_model.dart';
import 'package:pharma/models/reward/reward_coupons_fixed_value.dart';

import '../../core/app_enum.dart';
import '../../models/basket_model.dart';
import '../../models/payment_process_response.dart';
import '../../models/product_response.dart';

class MyOrderState extends Equatable {
  ScreenStates screenStates;
  List<MyOrderResponse> myOrderList;
  List<MyOrderResponse> myOrderHistoryList;
  List<ProductResponse> productList;
  List<ProductResponse> productListp;
  final PaymentProcessResponse? paymentProcessResponse;
  BasketModel basketModel;
  int indexTap;
  bool isLoading;
  bool isLoadingDelete;
  bool isLoadingConfirm;
  bool isErrorDelete;
  bool isErrorConfirm;
  bool success;
  bool successDelete;
  bool successConfirm;
  bool isCartPricesFetched;
  String error;
  String errorDelete;
  bool check;
  int totalPrice;
  List<Product> quantityInBasket;
  int idBasket;
  final RewardCouponsFixedValueModel? rewardCouponsFixedValueModel;

  MyOrderState({
    this.screenStates = ScreenStates.loading,
    this.myOrderList = const [],
    this.myOrderHistoryList = const [],
    this.productList = const [],
    this.productListp = const [],
    this.isLoading = false,
    this.isLoadingDelete = false,
    this.isLoadingConfirm = false,
    this.isErrorDelete = false,
    this.isErrorConfirm = false,
    this.success = false,
    this.successDelete = false,
    this.successConfirm = false,
    this.isCartPricesFetched = false,
    this.error = '',
    this.errorDelete = '',
    required this.basketModel,
    this.indexTap = 0,
    this.check = false,
    this.totalPrice = 0,
    this.quantityInBasket = const [],
    this.paymentProcessResponse,
    this.idBasket = 0,
    this.rewardCouponsFixedValueModel,
  });

  MyOrderState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,
    bool? isLoadingDelete,
    bool? isLoadingConfirm,
    bool? isErrorDelete,
    bool? isErrorConfirm,
    bool? success,
    bool? successDelete,
    bool? successConfirm,
    bool? isCartPricesFetched,
    String? error,
    String? errorDelete,
    List<MyOrderResponse>? myOrderList,
    List<MyOrderResponse>? myOrderHistoryList,
    List<ProductResponse>? productList,
    List<ProductResponse>? productListp,
    List<Product>? quantityInBasket,
    int? totalPrice,
    BasketModel? basketModel,
    int? indexTap,
    bool? check,
    PaymentProcessResponse? paymentProcessResponse,
    int? idBasket,
    RewardCouponsFixedValueModel? rewardCouponsFixedValueModel,
  }) {
    return MyOrderState(
      myOrderList: myOrderList ?? this.myOrderList,
      myOrderHistoryList: myOrderHistoryList ?? this.myOrderHistoryList,
      productList: productList ?? this.productList,
      productListp: productListp ?? this.productListp,
      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading ?? false,
      isLoadingDelete: isLoadingDelete ?? false,
      isLoadingConfirm: isLoadingConfirm ?? false,
      isErrorDelete: isErrorDelete ?? false,
      isErrorConfirm: isErrorConfirm ?? false,
      error: error ?? '',
      errorDelete: errorDelete ?? '',
      success: success ?? false,
      successDelete: successDelete ?? false,
      successConfirm: successConfirm ?? false,
      isCartPricesFetched: isCartPricesFetched ?? false,
      basketModel: basketModel ?? this.basketModel,
      indexTap: indexTap ?? this.indexTap,
      check: check ?? this.check,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentProcessResponse:
          paymentProcessResponse ?? this.paymentProcessResponse,
      quantityInBasket: quantityInBasket ?? this.quantityInBasket,
      idBasket: idBasket ?? this.idBasket,
      rewardCouponsFixedValueModel:
          rewardCouponsFixedValueModel ?? this.rewardCouponsFixedValueModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        identityHashCode(this),
        screenStates,
        isLoading,
        isLoadingDelete,
        isLoadingConfirm,
        isErrorDelete,
        isErrorConfirm,
        success,
        successDelete,
        successConfirm,
        isCartPricesFetched,
        error,
        errorDelete,
        myOrderList,
        productList,
        productListp,
        basketModel,
        indexTap,
        check,
        totalPrice,
        paymentProcessResponse,
        quantityInBasket,
        idBasket,
        rewardCouponsFixedValueModel,
        myOrderHistoryList,
      ];
}
