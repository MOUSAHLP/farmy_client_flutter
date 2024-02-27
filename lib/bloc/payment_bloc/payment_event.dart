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

class AddToChossenAttrbiuteList extends PaymentEvent {
  final DeliveryAttributesResponse? attrbiuteData;

  const AddToChossenAttrbiuteList({
    this.attrbiuteData,
  });
}

class GetInvoicesDetails extends PaymentEvent {
  final InvoicesParms invoicesParmas;
  final List<ProductDetailsResponse>? productList;

  const GetInvoicesDetails({
    required this.invoicesParmas,
        required this.productList
      });
}

class RemoveFromChossenList extends PaymentEvent {
  final DeliveryAttributesResponse? attributeData;

  const RemoveFromChossenList({
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


class ToogleDeleveryMethod extends PaymentEvent {
  final DeleveryMethodResponse? deleveryMethodData;

  const ToogleDeleveryMethod({
    this.deleveryMethodData,
  });
}

class CreateOrder extends PaymentEvent {
  final InvoicesParms invoicesParms;
  final List<ProductDetailsResponse> prductList;

  const CreateOrder({
    required this.invoicesParms,
    required this.prductList,
  });
}

class GetInitializeInvoice extends PaymentEvent {
  final PaymentProcessResponse initializeInvoice;

  const GetInitializeInvoice({
    required this.initializeInvoice,
  });
}
