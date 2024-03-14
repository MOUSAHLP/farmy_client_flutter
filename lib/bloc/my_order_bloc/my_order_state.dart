import 'package:equatable/equatable.dart';
import 'package:pharma/models/my_order_response.dart';

import '../../core/app_enum.dart';

class MyOrderState extends Equatable {
  ScreenStates screenStates;
  List<MyOrderResponse> myOrderList;
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
    List<MyOrderResponse>? myOrderList

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
    myOrderList
  ];
}

