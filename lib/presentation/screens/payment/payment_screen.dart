import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_bill_details_row.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_note_on_the_order_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_order_type_continer.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_total_price.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/presentation/widgets/select_location.dart';
import 'package:pharma/translations.dart';

import '../../widgets/dialogs/confirm_payment_order_dialog.dart';
import '../home_screen/home_screen.dart';
import 'widgets/custom_change_on_the_order_container.dart';
import 'widgets/custom_discount_code_continer.dart';
import 'widgets/custom_payment_status_continer.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentProcessResponse paymentProcessResponse;

  const PaymentScreen({super.key, required this.paymentProcessResponse});

  @override
  Widget build(BuildContext context) {
    print(paymentProcessResponse.deleveryMethodList!.length);
    return BlocProvider(
      create: (context) => sl<PaymentBloc>()
        ..add(GetInitializeInvoice(initializeInvoice: paymentProcessResponse)),
      child: PaymentBody(),
    );
  }
}

class PaymentBody extends StatelessWidget {
  PaymentBody({super.key});

  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          log(state.toString());
          if (state.screenState == ScreenStates.loading) {
            LoadingDialog().openDialog(context);
          }
          if (state.screenState == ScreenStates.success) {
            LoadingDialog().closeDialog(context);
          }
          if (state.screenState == ScreenStates.error) {
            LoadingDialog().closeDialog(context);
            ErrorDialog.openDialog(context, "some thing went wrong");
          }
          if (state.completePaymentStates == CompletePaymentStates.complete) {
            LoadingDialog().closeDialog(context);

            ConfirmPaymentOrderDialog.openDialog(
                context, AppLocalizations.of(context)!.orderSuccesfulyComplete);
          }
          if (state.completePaymentStates == CompletePaymentStates.loading) {
            LoadingDialog().openDialog(context);
          }
          if (state.completePaymentStates == CompletePaymentStates.error) {
            LoadingDialog().closeDialog(context);
            ErrorDialog.openDialog(context, state.errorMessage);
          }
        },
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            log("state $state");
            return Scaffold(
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBarScreen(
                            sectionName: AppLocalizations.of(context)!.payment),
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 21),
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .payment_statment,
                                    style: getRegularStyle(
                                        color: ColorManager.grayForMessage,
                                        fontSize: FontSizeApp.s16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.address,
                                      style: getBoldStyle(
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    const SizedBox(height: 4),
                                    GestureDetector(
                                      onTap: () {
                                        AppRouter.push(
                                            context, const LocationScreen());
                                      },
                                      child: BlocBuilder<LocationBloc,
                                          LocationState>(
                                        builder: (context, state) {
                                          return SelectLocation(
                                              favoriteuserAddress:
                                                  state.addressCurrent);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 21),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.conduction,
                                      style: getBoldStyle(
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    const SizedBox(height: 4),
                                    for (var item in state
                                        .paymentProcessResponse!
                                        .deleveryMethodList!)
                                      BlocBuilder<LocationBloc, LocationState>(
                                        builder: (context, loctionstate) {
                                          return buildCustomOrderTypeContainer(
                                              context,
                                              loctionstate,
                                              item,
                                              state);
                                        },
                                      ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 21),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.payment,
                                      style: getBoldStyle(
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    const SizedBox(height: 4),
                                    CustomPaymentStatusContiner(
                                      image: ImageManager.farmySmile,
                                      text: AppLocalizations.of(context)!
                                          .cash_payment,
                                      paymentState: PaymentStates.cashPayment,
                                    ),
                                    const SizedBox(height: 12),
                                    CustomPaymentStatusContiner(
                                      image: ImageManager.farmySmile,
                                      text: AppLocalizations.of(context)!
                                          .farmy_wallet,
                                      paymentState: PaymentStates.farmyWallet,
                                    ),
                                  ],
                                ),
                              ),
                              //todo
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.hasm_code,
                                      style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: CustomDiscountCodeContiner(
                                            imageUrl: ImageManager.codeDiscount,
                                            subjectText:
                                                AppLocalizations.of(context)!
                                                    .hasm_code,
                                          )),
                                          const SizedBox(width: 4),
                                          Expanded(
                                              child: CustomDiscountCodeContiner(
                                            isReplacePoint: true,
                                            imageUrl: ImageManager.replacePoint,
                                            subjectText:
                                                AppLocalizations.of(context)!
                                                    .redeem_points,
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //  todo
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "لا يمكنك استخدام كود الحسم واستبدال النقاط معا (اختر واحدة فقط)",
                                    style: getRegularStyle(
                                        color: ColorManager.grayForMessage),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "لقد حصلت على حسم 5000 ل.س من مجمل الفاتورة",
                                    style: getBoldStyle(
                                        color: ColorManager.redForFavorite,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.reviews,
                                      style: getBoldStyle(
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    const SizedBox(height: 4),
                                    InputFieldAuth(
                                      controller: noteController,
                                      maxLines: 5,
                                      minLines: 5,
                                      height: .30.sw,
                                      width: 1.sw,
                                      color: ColorManager.lightGray,
                                      hintText: AppLocalizations.of(context)!
                                          .add_notes,
                                      hintStyle: getRegularStyle(
                                          color: ColorManager.grayForMessage),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .requiredChange,
                                      style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: FontSizeApp.s14),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 1.sw,
                                      child: GridView.builder(
                                        itemCount: state.paymentProcessResponse!
                                            .deleveryAttributesList!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      offset: Offset(1, 2),
                                                      spreadRadius: 1.5,
                                                      color: ColorManager
                                                          .grayForSearch)
                                                ]),
                                            child: CustomChangeOnTheOrder(
                                              onTab: () {
                                                if (context
                                                    .read<PaymentBloc>()
                                                    .state
                                                    .attrbiuteChossenList
                                                    .any((element) =>
                                                        element.id ==
                                                        state
                                                            .paymentProcessResponse!
                                                            .deleveryAttributesList![
                                                                index]
                                                            .id)) {
                                                  /// todo : change DeliveryAttributesResponse to changeResponse
                                                  context.read<PaymentBloc>().add(
                                                      RemoveChangeAttributeList(
                                                          attributeData: state
                                                                  .paymentProcessResponse!
                                                                  .deleveryAttributesList![
                                                              index]));
                                                } else {
                                                  /// todo : change DeliveryAttributesResponse to changeResponse
                                                  context.read<PaymentBloc>().add(
                                                      AddChangeAttributeList(
                                                          attributeData: state
                                                                  .paymentProcessResponse!
                                                                  .deleveryAttributesList![
                                                              index]));
                                                }
                                              },
                                              isSelected: context
                                                      .read<PaymentBloc>()
                                                      .state
                                                      .attrbiuteChossenList
                                                      .any((element) =>
                                                          element.id ==
                                                          state
                                                              .paymentProcessResponse!
                                                              .deleveryAttributesList![
                                                                  index]
                                                              .id)
                                                  ? true
                                                  : false,
                                              changeText: state
                                                  .paymentProcessResponse!
                                                  .deleveryAttributesList![
                                                      index]
                                                  .nameDeleveryAttribute!,
                                            ),
                                          );
                                        },
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 30,
                                                mainAxisSpacing: 10,
                                                mainAxisExtent: 30,
                                                crossAxisCount: 3),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 38, left: 38, top: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.invoice,
                                      style: getUnderBoldStyle(
                                              color:
                                                  ColorManager.grayForMessage,
                                              fontSize: FontSizeApp.s14)!
                                          .copyWith(height: 1),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 21, left: 21, bottom: 11),
                                child: Column(
                                  children: [
                                    CustomBillDetailsRow(
                                        subStatusBill:
                                            AppLocalizations.of(context)!
                                                .total_amount,
                                        price: state
                                                    .paymentProcessResponse!
                                                    .invociesResponse!
                                                    .subTotal !=
                                                null
                                            ? Formatter.formatPrice(state
                                                .paymentProcessResponse!
                                                .invociesResponse!
                                                .subTotal!)
                                            : AppValueConst.defaultInvoiceValue
                                                .toString()),
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .hasm_code,
                                      price: state
                                                  .paymentProcessResponse!
                                                  .invociesResponse!
                                                  .coponValue !=
                                              null
                                          ? Formatter.formatPrice(state
                                              .paymentProcessResponse!
                                              .invociesResponse!
                                              .coponValue!)
                                          : AppValueConst.defaultInvoiceValue
                                              .toString(),
                                    ),
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .deliverycharges,
                                      price: (state
                                                  .paymentProcessResponse!
                                                  .invociesResponse!
                                                  .deliveryValue ??
                                              0)
                                          .toString(),
                                    ),
                                    CustomBillDetailsRow(
                                        subStatusBill:
                                            AppLocalizations.of(context)!.tax,
                                        price: state.paymentProcessResponse!
                                                    .invociesResponse!.tax !=
                                                null
                                            ? Formatter.formatPrice(state
                                                .paymentProcessResponse!
                                                .invociesResponse!
                                                .tax!)
                                            : AppValueConst.defaultInvoiceValue
                                                .toString()),
                                    CustomBillDetailsRow(
                                        colorText: ColorManager.primaryGreen,
                                        subStatusBill:
                                            AppLocalizations.of(context)!.total,
                                        price: state.paymentProcessResponse!
                                                    .invociesResponse!.total !=
                                                null
                                            ? Formatter.formatPrice(state
                                                .paymentProcessResponse!
                                                .invociesResponse!
                                                .total!)
                                            : AppValueConst.defaultInvoiceValue
                                                .toString())
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomTotalPrice(
                    title: AppLocalizations.of(context)!
                        .total_price
                        .replaceAll(":", ""),
                    totoalPrice:
                        state.paymentProcessResponse!.invociesResponse!.total !=
                                null
                            ? Formatter.formatPrice(state
                                .paymentProcessResponse!
                                .invociesResponse!
                                .total!)
                            : AppValueConst.defaultInvoiceValue.toString(),
                    onCompletePayment: () {
                      context.read<PaymentBloc>().add(CreateOrder(
                            prductList:
                                context.read<BasketBloc>().state.prductList!,
                            invoicesParms: InvoicesParms(
                                notes: noteController.text,
                                deliveryMethodId:
                                    state.deleveryMethodChossenList.isNotEmpty
                                        ? state.deleveryMethodChossenList[0].id!
                                        : 0,
                                userAddressid: context
                                    .read<LocationBloc>()
                                    .state
                                    .addressCurrent
                                    .id!),
                          ));
                    },
                    onCompleteShopping: () {
                      AppRouter.pushReplacement(context, const HomeScreen());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  CutomOrderTypeContiner buildCustomOrderTypeContainer(
      BuildContext context,
      LocationState loctionstate,
      DeleveryMethodResponse item,
      PaymentState state) {
    return CutomOrderTypeContiner(
      isChossenLocation:
          context.read<LocationBloc>().state.addressCurrent.latitude != null,
      userAddressid: loctionstate.addressCurrent.id ?? 0,
      delveryField: item,
      isSelected: state.deleveryMethodChossenList
          .any((element) => element.id == item.id),
      deliverycost:
          "${AppLocalizations.of(context)!.delivery_cost} ${state.paymentProcessResponse!.invociesResponse!.deliveryValue}",
      image: ImageManager.dateTimeImage,
      text:
          "${item.deleveryName} (${state.paymentProcessResponse!.invociesResponse!.deliveryValue})",
      onTap: () {
        if (!state.deleveryMethodChossenList
            .any((element) => element.id == item.id)) {
          if (context.read<LocationBloc>().state.addressCurrent.latitude !=
              null) {
            context
                .read<PaymentBloc>()
                .add(ToogleDeleveryMethod(deleveryMethodData: item));
            context.read<PaymentBloc>().add(GetInvoicesDetails(
                invoicesParmas: InvoicesParms(
                    notes: noteController.text,
                    deliveryMethodId: item.id!,
                    userAddressid: loctionstate.addressCurrent.id!),
                productList: context.read<BasketBloc>().state.prductList));
          }
        }
      },
    );
  }
}
