// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_bloc.dart';

class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class OrderEvent extends PaymentEvent {
  final OrderStates orderStates;

  const OrderEvent({required this.orderStates});
}

class ChoosePaymentStatusEvent extends PaymentEvent {
  final PaymentStates paymentState;

  const ChoosePaymentStatusEvent({
    required this.paymentState,
  });
}

class GetPaymentDetailsEvent extends PaymentEvent {}

class AddToChosenAttributeList extends PaymentEvent {
  final DeliveryAttributesResponse? attributeData;

  const AddToChosenAttributeList({
    this.attributeData,
  });
}

class GetInvoicesDetails extends PaymentEvent {
  final InvoicesParams invoicesParams;
  final List<ProductResponse>? productList;
  final int? id;

  const GetInvoicesDetails({
    required this.invoicesParams,
    required this.productList,
    this.id,
  });
}

class RemoveFromChosenList extends PaymentEvent {
  final DeliveryAttributesResponse? attributeData;

  const RemoveFromChosenList({
    this.attributeData,
  });
}

class AddChangeAttributeList extends PaymentEvent {
  /// todo : change DeliveryAttributesResponse to changeResponse
  final DeliveryAttributesResponse? attributeData;

  const AddChangeAttributeList({
    this.attributeData,
  });
}

class RemoveChangeAttributeList extends PaymentEvent {
  /// todo : change DeliveryAttributesResponse to changeResponse
  final DeliveryAttributesResponse? attributeData;

  const RemoveChangeAttributeList({
    this.attributeData,
  });
}

class AddChangeList extends PaymentEvent {
  final DeliveryChangesResponse? addDeliveryChangesResponse;

  const AddChangeList({
    this.addDeliveryChangesResponse,
  });
}

class RemoveChangeList extends PaymentEvent {
  final DeliveryChangesResponse? removeDeliveryChangesResponse;

  const RemoveChangeList({
    this.removeDeliveryChangesResponse,
  });
}

class ToggleDeliveryMethod extends PaymentEvent {
  final DeliveryMethodResponse? deliveryMethodData;

  const ToggleDeliveryMethod({
    this.deliveryMethodData,
  });
}

class CreateOrder extends PaymentEvent {
  final InvoicesParams invoicesParams;
  final List<ProductResponse> productList;
  final int? idBasket;

  const CreateOrder(
    this.idBasket, {
    required this.invoicesParams,
    required this.productList,
  });
}

class ProceedToCheckout extends PaymentEvent {
  const ProceedToCheckout();
}

class GetInitializeInvoice extends PaymentEvent {
  final PaymentProcessResponse initializeInvoice;

  const GetInitializeInvoice({
    required this.initializeInvoice,
  });
}

class GetTimeEvent extends PaymentEvent {
  final String time;

  const GetTimeEvent({
    required this.time,
  });
}

class SelectedMinutesEvents extends PaymentEvent {
  final bool isExpandedMinutes;

  const SelectedMinutesEvents(this.isExpandedMinutes);
}

class SelectedHoursEvents extends PaymentEvent {
  final bool isExpandedHour;

  const SelectedHoursEvents(this.isExpandedHour);
}

class GetCoupon extends PaymentEvent {
  final String? couponId;
  final String? couponCode;

  const GetCoupon(this.couponId, this.couponCode);
}
