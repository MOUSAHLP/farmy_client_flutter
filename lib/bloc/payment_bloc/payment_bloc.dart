import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentEvent>(
      (event, emit) {
        if (event is OrderEvent) {
          emit(state.copyWith(orderState: event.orderStates));
        }
        if (event is ChoosePaymentStatusEvent) {
          emit(state.copyWith(paymentState: event.paymentState));
        }
      },
    );
  }
}
