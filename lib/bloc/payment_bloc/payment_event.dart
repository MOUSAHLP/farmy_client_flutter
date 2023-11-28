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
