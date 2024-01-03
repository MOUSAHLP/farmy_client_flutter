part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;
  final List<DeleveryAttributesResponse> attrbiuteChossenList;  

  const PaymentState(
      {this.screenState,
      this.orderState,
      this.paymentState,
      this.attrbiuteChossenList = const []});
  PaymentState copyWith(
      {ScreenStates? screenState,
      OrderStates? orderState,
      PaymentStates? paymentState,
      List<DeleveryAttributesResponse>? attrbiuteChossenList}) {
    return PaymentState(
        attrbiuteChossenList: attrbiuteChossenList ?? this.attrbiuteChossenList,
        screenState: screenState ?? this.screenState,
        orderState: orderState ?? this.orderState,
        paymentState: paymentState ?? this.paymentState);
  }

  @override
  List<Object?> get props =>
      [screenState, orderState, paymentState, attrbiuteChossenList];
}
