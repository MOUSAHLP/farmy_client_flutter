part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;
  final PaymentProcessResponse? paymentProcessResponse;
  final List<DeliveryAttributesResponse> attrbiuteChossenList;
  final List<DeleveryMethodResponse> deleveryMethodChossenList;
  final int? deleveryCost;
  final CompletePaymentStates? completePaymentStates;
  final String? errorMessage;

  const PaymentState({
    this.screenState,
    this.paymentProcessResponse,
    this.completePaymentStates,
    this.errorMessage,
    this.orderState,
    this.deleveryCost = 0,
    this.paymentState,
    this.deleveryMethodChossenList = const [],
    this.attrbiuteChossenList = const [],
  });

  PaymentState copyWith({
    ScreenStates? screenState,
    OrderStates? orderState,
    int? deleveryCost,
    PaymentProcessResponse? paymentProcessResponse,
    CompletePaymentStates? completePaymentStates,
    String? errorMessage,
    List<DeleveryMethodResponse>? deleveryMethodChossenList,
    PaymentStates? paymentState,
    List<DeliveryAttributesResponse>? attrbiuteChossenList,
    bool? isCompletePayment,
  }) {
    return PaymentState(
      completePaymentStates:
          completePaymentStates ?? CompletePaymentStates.initialized,
      paymentProcessResponse:
          paymentProcessResponse ?? this.paymentProcessResponse,
      deleveryCost: deleveryCost ?? this.deleveryCost,
      deleveryMethodChossenList:
          deleveryMethodChossenList ?? this.deleveryMethodChossenList,
      attrbiuteChossenList: attrbiuteChossenList ?? this.attrbiuteChossenList,
      screenState: screenState ?? ScreenStates.initialized,
      orderState: orderState ?? this.orderState,
      paymentState: paymentState ?? this.paymentState,
      errorMessage: errorMessage ?? "",
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenState,
        orderState,
        paymentState,
        deleveryCost,
        attrbiuteChossenList,
        deleveryMethodChossenList,
        paymentProcessResponse,
        completePaymentStates,
        errorMessage
      ];
}
