import 'package:equatable/equatable.dart';
import 'package:pharma/models/my_order_response.dart';

import '../../core/app_enum.dart';

// abstract class MyOrderState {}
//
// class MyOrderLoading extends MyOrderState {}
// class DeleteOrderLoading extends MyOrderState {}
//
// class MyOrderError extends MyOrderState {
//   String error;
//   MyOrderError(this.error);
// }
// class DeleteOrderError extends MyOrderState {
//   String error;
//   DeleteOrderError(this.error);
// }
//
// class MyOrderSuccess extends MyOrderState {
//   List<MyOrderResponse> myOrderList;
//   MyOrderSuccess(this.myOrderList);
// }
// class DeleteOrderSuccess extends MyOrderState {
//
//   DeleteOrderSuccess();
// }

class MyOrderState extends Equatable {
  ScreenStates screenStates;
  List<MyOrderResponse> myOrderList;
  bool isLoading;
  bool isLoadingDelet;
  bool isErrorDelet;
  bool success;
  bool successDelet;
  String error;
  String errorDelet;
  MyOrderState({
    this.screenStates = ScreenStates.loading,
   this.myOrderList=const [],
    this.isLoading=false,
    this.isLoadingDelet=false,
    this.isErrorDelet=false,
    this.success=false,
    this.successDelet=false,
    this.error='',
    this.errorDelet='',
  });
  MyOrderState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,
    bool? isLoadingDelet,
    bool? isErrorDelet,
    bool? success,
    bool? successDelet,
    String? error,
    String? errorDelet,
    List<MyOrderResponse>? myOrderList

  }){
    return MyOrderState(
      myOrderList:myOrderList??this.myOrderList,
      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading??false,
      isLoadingDelet: isLoadingDelet??false,
      isErrorDelet: isErrorDelet??false,
      error: error??'',
      errorDelet: errorDelet??'',
      success: success??false,
      successDelet: successDelet??false,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    screenStates,
    isLoading,
    isLoadingDelet,
    isErrorDelet,
    success,
    successDelet,
    error,
    errorDelet,
    myOrderList
  ];
}

