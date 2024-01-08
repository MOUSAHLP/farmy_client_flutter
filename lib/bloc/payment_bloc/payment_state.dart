part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;
  final List<DeleveryAttributesResponse> attrbiuteChossenList;
  final List<DeleveryMethodResponse> deleveryMethodChossenList;
  final String? deleveryCost;

  const PaymentState(
      {this.screenState,
      this.orderState,
      this.deleveryCost="0",
      this.paymentState,
      this.deleveryMethodChossenList = const [],
      this.attrbiuteChossenList = const []});
  PaymentState copyWith(
      {ScreenStates? screenState,
      OrderStates? orderState,
      String? deleveryCost,
      List<DeleveryMethodResponse>? deleveryMethodChossenList,
      PaymentStates? paymentState,
      List<DeleveryAttributesResponse>? attrbiuteChossenList}) {
    return PaymentState(
        deleveryCost: deleveryCost ?? this.deleveryCost,
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
        deleveryCost,
        attrbiuteChossenList,
        deleveryMethodChossenList
      ];
}
