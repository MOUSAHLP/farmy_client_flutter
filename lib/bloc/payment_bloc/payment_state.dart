part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final ScreenStates? screenState;
  final OrderStates? orderState;
  final PaymentStates? paymentState;
  final PaymentProcessResponse? paymentProcessResponse;
  final List<DeliveryAttributesResponse> attributeChosenList;
  final List<DeliveryMethodResponse> deliveryMethodChosenList;
  final List<DeliveryChangesResponse> deliveryChangesList;
  final int? deliveryCost;
  final CompletePaymentStates? completePaymentStates;
  final String? errorMessage;

  const PaymentState({
    this.screenState,
    this.paymentProcessResponse,
    this.completePaymentStates,
    this.errorMessage,
    this.orderState,
    this.deliveryCost = 0,
    this.paymentState,
    this.deliveryMethodChosenList = const [],
    this.attributeChosenList = const [],
    this.deliveryChangesList = const [],
  });

  PaymentState copyWith({
    ScreenStates? screenState,
    OrderStates? orderState,
    int? deliveryCost,
    PaymentProcessResponse? paymentProcessResponse,
    CompletePaymentStates? completePaymentStates,
    String? errorMessage,
    List<DeliveryMethodResponse>? deliveryMethodChosenList,
    List<DeliveryChangesResponse>? deliveryChangesList,
    PaymentStates? paymentState,
    List<DeliveryAttributesResponse>? attributeChosenList,
    bool? isCompletePayment,
  }) {
    return PaymentState(
      completePaymentStates:
          completePaymentStates ?? CompletePaymentStates.initialized,
      paymentProcessResponse:
          paymentProcessResponse ?? this.paymentProcessResponse,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      deliveryMethodChosenList:
          deliveryMethodChosenList ?? this.deliveryMethodChosenList,
      deliveryChangesList: deliveryChangesList ?? this.deliveryChangesList,
      attributeChosenList: attributeChosenList ?? this.attributeChosenList,
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
        deliveryCost,
        attributeChosenList,
        deliveryChangesList,
        deliveryMethodChosenList,
        paymentProcessResponse,
        completePaymentStates,
        errorMessage,
      ];
}
