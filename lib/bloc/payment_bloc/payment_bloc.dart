import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/models/delivery_changes_response.dart';
import 'package:pharma/models/delivery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/invoices_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/models/product_response.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentRepo paymentRepo;

  PaymentBloc({required this.paymentRepo})
      : super(
          PaymentState(
            paymentProcessResponse: PaymentProcessResponse(
              deliveryChangesResponse: [],
              deliveryAttributeList: [],
              deliveryMethodList: [],
              invoicesResponse: InvociesResponse(),
              userAddressList: [],
            ),
          ),
        ) {
    on<PaymentEvent>(
      (event, emit) async {
        if (event is OrderEvent) {
          emit(state.copyWith(orderState: event.orderStates));
        }
        if (event is ChoosePaymentStatusEvent) {
          emit(state.copyWith(paymentState: event.paymentState));
        }
        if (event is AddToChosenAttributeList) {
          List<DeliveryAttributesResponse> mutableChosenAttributeList =
              List.from(state.attributeChosenList);
          mutableChosenAttributeList.add(event.attributeData!);
          emit(state.copyWith(attributeChosenList: mutableChosenAttributeList));
        }
        if (event is RemoveFromChosenList) {
          List<DeliveryAttributesResponse> mutableChosenAttributeList =
              List.from(state.attributeChosenList);
          mutableChosenAttributeList
              .removeWhere((element) => element.id == event.attributeData!.id);
          emit(state.copyWith(attributeChosenList: mutableChosenAttributeList));
        }
        if (event is AddChangeAttributeList) {
          /// todo : change DeliveryAttributesResponse to changeResponse
          List<DeliveryAttributesResponse> mutableChangeList =
              List.from(state.attributeChosenList);
          mutableChangeList.add(event.attributeData!);
          emit(state.copyWith(attributeChosenList: mutableChangeList));
        }

        if (event is AddChangeList) {
          /// todo : change DeliveryAttributesResponse to changeResponse
          List<DeliveryChangesResponse> mutableChangeList =
              List.from(state.deliveryChangesList);
          mutableChangeList.add(event.addDeliveryChangesResponse!);
          emit(state.copyWith(deliveryChangesList: mutableChangeList));
        }

        if (event is RemoveChangeList) {
          /// todo : change DeliveryAttributesResponse to changeResponse
          List<DeliveryChangesResponse> mutableChangeList =
              List.from(state.deliveryChangesList);
          mutableChangeList.removeWhere((element) =>
              element.id == event.removeDeliveryChangesResponse!.id);
          emit(state.copyWith(deliveryChangesList: mutableChangeList));
        }

        if (event is RemoveChangeAttributeList) {
          /// todo : change DeliveryAttributesResponse to changeResponse
          List<DeliveryAttributesResponse> mutableChangeList =
              List.from(state.attributeChosenList);
          mutableChangeList
              .removeWhere((element) => element.id == event.attributeData!.id);
          emit(state.copyWith(attributeChosenList: mutableChangeList));
        }
        if (event is ToggleDeliveryMethod) {
          List<DeliveryMethodResponse> mutableChosenDeliveryMethodList =
              List.from(state.deliveryMethodChosenList);
          if (state.deliveryMethodChosenList
              .any((element) => element.id == event.deliveryMethodData!.id)) {
            mutableChosenDeliveryMethodList.removeWhere(
                (element) => element.id == event.deliveryMethodData!.id);
          } else {
            mutableChosenDeliveryMethodList = [];
            mutableChosenDeliveryMethodList.add(event.deliveryMethodData!);
          }
          emit(state.copyWith(
              deliveryMethodChosenList: mutableChosenDeliveryMethodList,
              deliveryCost:
                  event.deliveryMethodData!.deliveryPrice!));
        }
        if (event is GetInvoicesDetails) {

          emit(state.copyWith(screenState: ScreenStates.loading));
          PaymentProcessParams paymentProcessParams = PaymentProcessParams(productInBasketList: event.productList!);
          (await paymentRepo.getInvoiceDetails(paymentProcessParams, event.invoicesParams))
              .fold(
            (l) => emit(state.copyWith(screenState: ScreenStates.error)),
            (r) => emit(
              state.copyWith(
                  screenState: ScreenStates.success, paymentProcessResponse: r),
            ),
          );
        }
        if (event is CreateOrder) {
          // List<int?> ids = state.deliveryChangesList.map((e) => e.id).toList();

          emit(state.copyWith(
              completePaymentStates: CompletePaymentStates.loading));
          PaymentProcessParams paymentProcessParams = PaymentProcessParams(productInBasketList: event.productList);
          (await paymentRepo.createOrder(
            paymentProcessParams,
            event.invoicesParams,
            state.attributeChosenList,
            state.deliveryChangesList.map((e) => e.id).toList(),
          ))
              .fold(
            (l) => emit(
              state.copyWith(
                  completePaymentStates: CompletePaymentStates.error,
                  errorMessage: l),
            ),
            (r) => emit(
              state.copyWith(
                  completePaymentStates: CompletePaymentStates.complete,
                  orderId: r["id"]),
            ),
          );
        }

        if (event is GetInitializeInvoice) {
          emit(state.copyWith(paymentProcessResponse: event.initializeInvoice));
        }
        if (event is GetTimeEvent) {
          emit(state.copyWith(time: event.time));
        }
        if (event is SelectedMinutesEvents) {
          emit(state.copyWith(isExpandedMinutes: !event.isExpandedMinutes));
        }
        if (event is SelectedHoursEvents) {
          emit(state.copyWith(isExpandedHours: !event.isExpandedHour));
        }
      },
    );
  }
}
