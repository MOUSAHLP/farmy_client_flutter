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

  const GetInvoicesDetails({
    required this.invoicesParams,
        required this.productList
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
  /// todo : change DeliveryAttributesResponse to changeResponse
  final DeliveryChangesResponse? addDeliveryChangesResponse;

  const AddChangeList({
    this.addDeliveryChangesResponse,
  });
}

class RemoveChangeList extends PaymentEvent {
  /// todo : change DeliveryAttributesResponse to changeResponse
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

  const CreateOrder({
    required this.invoicesParams,
    required this.productList,
  });
}

class GetInitializeInvoice extends PaymentEvent {
  final PaymentProcessResponse initializeInvoice;

  const GetInitializeInvoice({
    required this.initializeInvoice,
  });
}
