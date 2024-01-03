part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;
  final List<DeleveryAttributesResponse> attrbiuteChossenList;
  final List<DeleveryMethodResponse> deleveryMethodChossenList;

  const PaymentState(
      {this.screenState,
      this.orderState,
      this.paymentState,
      this.deleveryMethodChossenList = const [],
      this.attrbiuteChossenList = const []});
  PaymentState copyWith(
      {ScreenStates? screenState,
      OrderStates? orderState,
      List<DeleveryMethodResponse>? deleveryMethodChossenList,
      PaymentStates? paymentState,
      List<DeleveryAttributesResponse>? attrbiuteChossenList}) {
    return PaymentState(
        deleveryMethodChossenList:
            deleveryMethodChossenList ?? this.deleveryMethodChossenList,
        attrbiuteChossenList: attrbiuteChossenList ?? this.attrbiuteChossenList,
        screenState: screenState ?? this.screenState,
        orderState: orderState ?? this.orderState,
        paymentState: paymentState ?? this.paymentState);
  }

  @override
  List<Object?> get props => [
        screenState,
        orderState,
        paymentState,
        attrbiuteChossenList,
        deleveryMethodChossenList
      ];
}
