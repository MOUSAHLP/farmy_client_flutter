part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;

  const PaymentState({this.screenState, this.orderState, this.paymentState});
  PaymentState copyWith(
      {ScreenStates? screenState,
      OrderStates? orderState,
      PaymentStates? paymentState}) {
    return PaymentState(
        screenState: screenState ?? this.screenState,
        orderState: orderState ?? this.orderState,
        paymentState: paymentState ?? this.paymentState);
  }

  @override
  List<Object?> get props => [screenState, orderState, paymentState];
}
