import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';

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
        if (event is AddToChossenAttrbiuteList) {
          List<DeleveryAttributesResponse> mutableChossenAttrbiuteList =
              List.from(state.attrbiuteChossenList);
          mutableChossenAttrbiuteList.add(event.attrbiuteData!);
          print(mutableChossenAttrbiuteList.length);
          emit(state.copyWith(
              attrbiuteChossenList: mutableChossenAttrbiuteList));
        }
        if (event is RemoveFromChossenList) {
          List<DeleveryAttributesResponse> mutableChossenAttrbiuteList =
              List.from(state.attrbiuteChossenList);
          mutableChossenAttrbiuteList
              .removeWhere((element) => element.id == event.attrbiuteData!.id);
          emit(state.copyWith(
              attrbiuteChossenList: mutableChossenAttrbiuteList));
        }
        if (event is ToogleDeleveryMethod) {
          List<DeleveryMethodResponse> mutableChossenDeleveryMethodList =
              List.from(state.deleveryMethodChossenList);
          if (state.deleveryMethodChossenList
              .any((element) => element.id == event.deleveryMethodData!.id)) {
            mutableChossenDeleveryMethodList.removeWhere(
                (element) => element.id == event.deleveryMethodData!.id);
          } else {
            mutableChossenDeleveryMethodList = [];
            mutableChossenDeleveryMethodList.add(event.deleveryMethodData!);
          }
          emit(state.copyWith(
              deleveryMethodChossenList: mutableChossenDeleveryMethodList,
              deleveryCost: event.deleveryMethodData!.deleveyPrice));
        }
      },
    );
  }
}
