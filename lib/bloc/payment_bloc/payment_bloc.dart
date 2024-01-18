import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:extended_image/extended_image.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/invocies_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/models/product_details_response.dart';

import '../../core/app_enum.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentRepo paymentRepo;
  PaymentBloc({required this.paymentRepo})
      : super(PaymentState(
            paymentProcessResponse: PaymentProcessResponse(
                deleveryAttributesList: [],
                deleveryMethodList: [],
                invociesResponse: InvociesResponse(),
                userAdressList: []))) {
    on<PaymentEvent>(
      (event, emit) async {
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
            mutableChossenDeleveryMethodList.add(
              event.deleveryMethodData!,
            );
          }
          emit(state.copyWith(
              deleveryMethodChossenList: mutableChossenDeleveryMethodList,
              deleveryCost: event.deleveryMethodData!.deleveyPrice));
        }
        if (event is GetInvoicesDetails) {
          emit(state.copyWith(screenState: ScreenStates.loading));
          PaymentProcessParms paymentProcessParms =
              PaymentProcessParms(prodictInBasketList: event.prductList!);
          (await paymentRepo.getInvoiceDetails(
                  paymentProcessParms, event.invoicesParms))
              .fold(
                  (l) => emit(state.copyWith(screenState: ScreenStates.error)),
                  (r) => emit(state.copyWith(
                      screenState: ScreenStates.success,
                      paymentProcessResponse: r)));
        }
        if (event is CreateOrder) {
          emit(state.copyWith(
              completePaymentStates: CompletePaymentStates.loading));
          PaymentProcessParms paymentProcessParms =
              PaymentProcessParms(prodictInBasketList: event.prductList);
          (await paymentRepo.createOrder(
            paymentProcessParms,
            event.invoicesParms,
            state.attrbiuteChossenList,
          ))
              .fold(
                  (l) => emit(state.copyWith(
                      completePaymentStates: CompletePaymentStates.error,
                      errorMessage: l)),
                  (r) => emit(state.copyWith(
                      completePaymentStates: CompletePaymentStates.complete)));
        }
        if (event is GetInitializeInvoice) {
          print(event.initializeInvoice.deleveryAttributesList!.length);
          emit(state.copyWith(paymentProcessResponse: event.initializeInvoice));
        }
      },
    );
  }
}
