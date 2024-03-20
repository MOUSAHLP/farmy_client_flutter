part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final int? orderId;
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
  final String? time;
  final String? hour;
  final String? minutes;
  final bool isExpandedMinutes;
  final bool isExpandedHours;

  const PaymentState({
    this.orderId,
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
    this.time,
    this.isExpandedMinutes = false,
    this.isExpandedHours = false,
    this.hour,
    this.minutes,
  });

  PaymentState copyWith({
    int? orderId,
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
    String? time,
    bool? isExpandedMinutes,
    bool? isExpandedHours,
  }) {
    return PaymentState(
      orderId: orderId,
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
      time: time ?? this.time,
      isExpandedMinutes: isExpandedMinutes ?? this.isExpandedMinutes,
      isExpandedHours: isExpandedHours ?? this.isExpandedHours,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        orderId,
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
        time,
        isExpandedMinutes,
        isExpandedHours,
      ];
}
