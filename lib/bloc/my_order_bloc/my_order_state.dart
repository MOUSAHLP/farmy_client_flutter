import 'package:equatable/equatable.dart';
import 'package:pharma/models/my_order_response.dart';

import '../../core/app_enum.dart';
import '../../models/basket_model.dart';

class MyOrderState extends Equatable {
  ScreenStates screenStates;
  List<MyOrderResponse> myOrderList;
  BasketModel basketModel;
  int indexTap;
  bool isLoading;
  bool isLoadingDelete;
  bool isErrorDelete;
  bool success;
  bool successDelete;
  String error;
  String errorDelete;
  MyOrderState({
    this.screenStates = ScreenStates.loading,
   this.myOrderList=const [],
    this.isLoading=false,
    this.isLoadingDelete=false,
    this.isErrorDelete=false,
    this.success=false,
    this.successDelete=false,
    this.error='',
    this.errorDelete='',
   required this.basketModel,
    this.indexTap=0
  });
  MyOrderState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,
    bool? isLoadingDelete,
    bool? isErrorDelete,
    bool? success,
    bool? successDelete,
    String? error,
    String? errorDelete,
    List<MyOrderResponse>? myOrderList,
    BasketModel? basketModel,
    int? indexTap

  }){
    return MyOrderState(
      myOrderList:myOrderList??this.myOrderList,
      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading??false,
      isLoadingDelete: isLoadingDelete??false,
      isErrorDelete: isErrorDelete??false,
      error: error??'',
      errorDelete: errorDelete??'',
      success: success??false,
      successDelete: successDelete??false,
      basketModel: basketModel??this.basketModel,
        indexTap:indexTap??this.indexTap
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    screenStates,
    isLoading,
    isLoadingDelete,
    isErrorDelete,
    success,
    successDelete,
    error,
    errorDelete,
    myOrderList,
    basketModel,
    indexTap
  ];
}

