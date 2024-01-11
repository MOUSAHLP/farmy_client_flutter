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
  const ChoosePaymentStatusEvent({required this.paymentState});
}

class GetPaymentDetailsEvent extends PaymentEvent {}

class AddToChossenAttrbiuteList extends PaymentEvent {
  final DeleveryAttributesResponse? attrbiuteData;
  const AddToChossenAttrbiuteList({
    this.attrbiuteData,
  });
}

class RemoveFromChossenList extends PaymentEvent {
  final DeleveryAttributesResponse? attrbiuteData;
  const RemoveFromChossenList({
    this.attrbiuteData,
  });
}

class ToogleDeleveryMethod extends PaymentEvent {
  final DeleveryMethodResponse? deleveryMethodData;
  const ToogleDeleveryMethod({
    this.deleveryMethodData,
  });
}
