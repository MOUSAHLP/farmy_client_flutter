import 'package:equatable/equatable.dart';
import 'package:pharma/models/my_order_response.dart';

import '../../core/app_enum.dart';
import '../../models/basket_model.dart';
import '../../models/payment_process_response.dart';
import '../../models/product_response.dart';

class MyOrderState extends Equatable {
  ScreenStates screenStates;
  List<MyOrderResponse> myOrderList;
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
  String error;
  String errorDelete;
  bool check;
  int totalPrice;
  MyOrderState({
    this.screenStates = ScreenStates.loading,
   this.myOrderList=const [],
   this.productList=const [],
   this.productListp=const [],
    this.isLoading=false,
    this.isLoadingDelete=false,
    this.isLoadingConfirm=false,
    this.isErrorDelete=false,
    this.isErrorConfirm=false,
    this.success=false,
    this.successDelete=false,
    this.successConfirm=false,
    this.error='',
    this.errorDelete='',
   required this.basketModel,
    this.indexTap=0,
    this.check = false,
    this.totalPrice = 0,
    this.paymentProcessResponse,
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
    String? error,
    String? errorDelete,
    List<MyOrderResponse>? myOrderList,
    List<ProductResponse>? productList,
    List<ProductResponse>? productListp,
    int? totalPrice,
    BasketModel? basketModel,
    int? indexTap,
    bool? check,
    PaymentProcessResponse? paymentProcessResponse,
  }){
    return MyOrderState(
      myOrderList:myOrderList??this.myOrderList,
      productList:productList??this.productList,
      productListp:productListp??this.productListp,
      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading??false,
      isLoadingDelete: isLoadingDelete??false,
      isLoadingConfirm: isLoadingConfirm??false,
      isErrorDelete: isErrorDelete??false,
      isErrorConfirm: isErrorConfirm??false,
      error: error??'',
      errorDelete: errorDelete??'',
      success: success??false,
      successDelete: successDelete??false,
      successConfirm: successConfirm??false,
      basketModel: basketModel??this.basketModel,
        indexTap:indexTap??this.indexTap,
      check: check ?? this.check,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentProcessResponse:
      paymentProcessResponse ?? this.paymentProcessResponse,

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
    error,
    errorDelete,
    myOrderList,
    productList,
    productListp,
    basketModel,
    indexTap,
    check,
    totalPrice
    ,  paymentProcessResponse,
  ];
}

