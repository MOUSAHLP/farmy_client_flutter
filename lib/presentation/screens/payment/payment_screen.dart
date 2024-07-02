import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/models/reward/reward_coupons_fixed_value.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/presentation/screens/order_screen/order_screen.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_bill_details_row.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_date_picker.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_discount_code_container.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_note_on_the_order_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_order_type_continer.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_total_price.dart';
import 'package:pharma/presentation/widgets/dialogs/confirm_payment_order_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/presentation/widgets/select_location.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import 'widgets/custom_change_on_the_order_container.dart';
import 'widgets/custom_discount_id_container.dart';
import 'widgets/custom_payment_status_container.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentProcessResponse paymentProcessResponse;
  final PaymentBloc paymentBloc = PaymentBloc(paymentRepo: PaymentRepo());
  final MyOrderBloc? myOrderBloc;
  final int? idBasket;
  final RewardCouponsFixedValueModel rewardCouponsFixedValueModel;

  PaymentScreen({
    super.key,
    required this.paymentProcessResponse,
    this.myOrderBloc,
    this.idBasket,
    required this.rewardCouponsFixedValueModel,
  });

  @override
  Widget build(BuildContext context) {
    paymentBloc
        .add(GetInitializeInvoice(initializeInvoice: paymentProcessResponse));
    return PaymentBody(
      paymentBloc: paymentBloc,
      myOrderBloc: myOrderBloc,
      idBasket: idBasket,
      rewardCouponsFixedValueModel: rewardCouponsFixedValueModel,
    );
  }
}

class PaymentBody extends StatelessWidget {
  final PaymentBloc paymentBloc;
  final MyOrderBloc? myOrderBloc;
  final int? idBasket;
  final RewardCouponsFixedValueModel rewardCouponsFixedValueModel;

  PaymentBody({
    super.key,
    required this.paymentBloc,
    this.myOrderBloc,
    this.idBasket,
    required this.rewardCouponsFixedValueModel,
  });

  final Duration animationDuration = const Duration(milliseconds: 500);

  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<PaymentBloc, PaymentState>(
        bloc: paymentBloc,
        listener: (context, state) {
          if (state.screenState == ScreenStates.loading) {
            LoadingDialog().openDialog(context);
          }
          if (state.screenState == ScreenStates.success) {
            LoadingDialog().closeDialog(context);
          }
          if (state.screenState == ScreenStates.error) {
            LoadingDialog().closeDialog(context);
            ErrorDialog.openDialog(context, state.errorMessage);
          }
          if (state.completePaymentStates == CompletePaymentStates.complete) {
            LoadingDialog().closeDialog(context);
            context.read<BasketBloc>().add(ClearBasket());
            ConfirmPaymentOrderDialog().closeDialog(context);
            context.read<HomeBloc>().currentIndex = 3;
            AppRouter.push(
              context,
              const OrderScreen(),
            );
          }
          if (state.completePaymentStates == CompletePaymentStates.loading) {
            LoadingDialog().openDialog(context);
          }
          if (state.completePaymentStates == CompletePaymentStates.error) {
            LoadingDialog().closeDialog(context);
            ErrorDialog.openDialog(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          // log("state $state");
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 150.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBarScreen(
                        sectionName: AppLocalizations.of(context)!.payment,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: 12.h,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                AppLocalizations.of(context)!.payment_statment,
                                style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s15.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 21,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.address,
                                    style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: FontSizeApp.s14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      AppRouter.push(
                                        context,
                                        const LocationScreen(),
                                      );
                                    },
                                    child: BlocBuilder<LocationBloc,
                                        LocationState>(
                                      builder: (context, state) {
                                        return SelectLocation(
                                          favoriteuserAddress:
                                              state.addressCurrent,
                                        );
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
                                      fontSize: FontSizeApp.s14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  for (var item in state.paymentProcessResponse!
                                      .deliveryMethodList!) ...[
                                    if (item.isSchedule &&
                                        !checkIsOpening(context)) ...[
                                      BlocBuilder<LocationBloc, LocationState>(
                                        builder: (context, locationState) {
                                          return buildCustomOrderTypeContainer(
                                            context,
                                            locationState,
                                            item,
                                            state,
                                            myOrderBloc,
                                          );
                                        },
                                      ),
                                    ] else if (!item.isSchedule &&
                                        checkIsOpening(context)) ...[
                                      BlocBuilder<LocationBloc, LocationState>(
                                        builder: (context, locationState) {
                                          return buildCustomOrderTypeContainer(
                                            context,
                                            locationState,
                                            item,
                                            state,
                                            myOrderBloc,
                                          );
                                        },
                                      ),
                                    ]
                                  ],
                                ],
                              ),
                            ),
                            // محفظة فارمي
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 21,
                            //   ),
                            // child: Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       AppLocalizations.of(context)!.payment,
                            //       style: getBoldStyle(
                            //         color: ColorManager.grayForMessage,
                            //         fontSize: FontSizeApp.s14,
                            //       ),
                            //     ),
                            // const SizedBox(height: 4),
                            // CustomPaymentStatusContainer(
                            //   image: ImageManager.farmySmile,
                            //   text: AppLocalizations.of(context)!
                            //       .cash_payment,
                            //   paymentState: PaymentStates.cashPayment,
                            // ),
                            // const SizedBox(height: 12),
                            // CustomPaymentStatusContainer(
                            //   image: ImageManager.farmySmile,
                            //   text: AppLocalizations.of(context)!
                            //       .farmy_wallet,
                            //   paymentState: PaymentStates.farmyWallet,
                            // ),
                            // ],
                            // ),
                            // ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: 21.w,
                                end: 21.w,
                                bottom: 12.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.hasm_code,
                                    style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomDiscountCodeContainer(
                                    idBasket: idBasket,
                                    paymentBloc: paymentBloc,
                                    myOrderBloc: myOrderBloc,
                                    notesText: noteController.text,
                                    rewardCouponsFixedValueModel:
                                        rewardCouponsFixedValueModel,
                                    imageUrl: ImageManager.codeDiscount,
                                    subjectText: AppLocalizations.of(context)!
                                        .redeem_points,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomDiscountIdContainer(
                                    myOrderBloc: myOrderBloc,
                                    paymentBloc: paymentBloc,
                                    idBasket: idBasket,
                                    notesText: noteController.text,
                                    rewardCouponsFixedValueModel:
                                        rewardCouponsFixedValueModel,
                                    isReplacePoint: true,
                                    imageUrl: ImageManager.replacePoint,
                                    subjectText: AppLocalizations.of(context)!
                                        .redeem_points,
                                  ),
                                ],
                              ),
                            ),
                            //  todo
                            Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              AppLocalizations.of(context)!
                                  .cannot_use_both_code_points,
                              style: getRegularStyle(
                                color: ColorManager.grayForMessage,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state.paymentProcessResponse!
                                        .invoicesResponse!.couponValue !=
                                    0)
                                  Text(
                                    " لقد حصلت على حسم ${state.paymentProcessResponse!.invoicesResponse!.couponValue} ل.س من مجمل الفاتورة",
                                    style: getBoldStyle(
                                      color: ColorManager.redForFavorite,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 21.w,
                                vertical: 12.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.reviews,
                                    style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: FontSizeApp.s14,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  InputFieldAuth(
                                    textDirection:
                                        DataStore.instance.lang == "ar"
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    controller: noteController,
                                    maxLines: 5,
                                    minLines: 5,
                                    height: .30.sw,
                                    width: 1.sw,
                                    color: ColorManager.lightGray,
                                    hintText:
                                        AppLocalizations.of(context)!.add_notes,
                                    hintStyle: getRegularStyle(
                                      color: ColorManager.grayForMessage,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 35.w,
                              ),
                              child: Column(
                                children: [
                                  for (int i = 0;
                                      i <
                                          state.paymentProcessResponse!
                                              .deliveryAttributeList!.length;
                                      i++)
                                    CustomNoteOnTheOrder(
                                      onTab: () {
                                        if (paymentBloc
                                            .state.attributeChosenList
                                            .any(
                                          (element) =>
                                              element.id ==
                                              state.paymentProcessResponse!
                                                  .deliveryAttributeList![i].id,
                                        )) {
                                          paymentBloc.add(
                                            RemoveFromChosenList(
                                              attributeData: state
                                                  .paymentProcessResponse!
                                                  .deliveryAttributeList![i],
                                            ),
                                          );
                                        } else {
                                          paymentBloc.add(
                                            AddToChosenAttributeList(
                                              attributeData: state
                                                  .paymentProcessResponse!
                                                  .deliveryAttributeList![i],
                                            ),
                                          );
                                        }
                                      },
                                      isSelected: paymentBloc
                                              .state.attributeChosenList
                                              .any(
                                        (element) =>
                                            element.id ==
                                            state.paymentProcessResponse!
                                                .deliveryAttributeList![i].id,
                                      )
                                          ? true
                                          : false,
                                      noteText: state
                                          .paymentProcessResponse!
                                          .deliveryAttributeList![i]
                                          .nameDeliveryAttribute!,
                                    ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 21,
                                vertical: 14,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .requiredChange,
                                    style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s14,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  SizedBox(
                                    width: 1.sw,
                                    child: GridView.builder(
                                      itemCount: state.paymentProcessResponse!
                                          .deliveryChangesResponse.length,
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
                                                color:
                                                    ColorManager.grayForSearch,
                                              ),
                                            ],
                                          ),
                                          child: CustomChangeOnTheOrder(
                                            onTab: () {
                                              if (paymentBloc
                                                  .state.deliveryChangesList
                                                  .any(
                                                (element) =>
                                                    element.id ==
                                                    state
                                                        .paymentProcessResponse!
                                                        .deliveryChangesResponse[
                                                            index]
                                                        .id,
                                              )) {
                                                /// todo : change DeliveryAttributesResponse to changeResponse
                                                paymentBloc.add(
                                                  RemoveChangeList(
                                                    removeDeliveryChangesResponse: state
                                                        .paymentProcessResponse!
                                                        .deliveryChangesResponse[index],
                                                  ),
                                                );
                                              } else {
                                                /// todo : change DeliveryAttributesResponse to changeResponse

                                                paymentBloc.add(
                                                  AddChangeList(
                                                    addDeliveryChangesResponse: state
                                                        .paymentProcessResponse!
                                                        .deliveryChangesResponse[index],
                                                  ),
                                                );
                                              }
                                            },
                                            isSelected: paymentBloc
                                                    .state.deliveryChangesList
                                                    .any(
                                              (element) =>
                                                  element.id ==
                                                  state
                                                      .paymentProcessResponse!
                                                      .deliveryChangesResponse[
                                                          index]
                                                      .id,
                                            )
                                                ? true
                                                : false,
                                            changeText: state
                                                .paymentProcessResponse!
                                                .deliveryChangesResponse[index]
                                                .value!,
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 30,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 30,
                                        crossAxisCount: 3,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                right: 38.w,
                                left: 38.w,
                                top: 15.h,
                                bottom: 7.h,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.invoice,
                                style: getUnderBoldStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s14,
                                )!
                                    .copyWith(height: 1),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                right: 21,
                                left: 21,
                                bottom: 11,
                              ),
                              child: Column(
                                children: [
                                  CustomBillDetailsRow(
                                    subStatusBill: AppLocalizations.of(context)!
                                        .total_amount,
                                    price: state.paymentProcessResponse!
                                                .invoicesResponse!.subTotal !=
                                            null
                                        ? Formatter.formatPrice(state
                                            .paymentProcessResponse!
                                            .invoicesResponse!
                                            .subTotal!)
                                        : AppValueConst.defaultInvoiceValue
                                            .toString(),
                                  ),
                                  if (state.paymentProcessResponse!
                                          .invoicesResponse!.couponValue !=
                                      0)
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .hasm_code,
                                      price: state
                                                  .paymentProcessResponse!
                                                  .invoicesResponse!
                                                  .couponValue !=
                                              null
                                          ? Formatter.formatPrice(
                                              state
                                                  .paymentProcessResponse!
                                                  .invoicesResponse!
                                                  .couponValue!,
                                            )
                                          : AppValueConst.defaultInvoiceValue
                                              .toString(),
                                    ),
                                  CustomBillDetailsRow(
                                    subStatusBill: AppLocalizations.of(context)!
                                        .deliverycharges,
                                    price: Formatter.formatPrice(state
                                            .paymentProcessResponse!
                                            .invoicesResponse!
                                            .deliveryValue ??
                                        0),
                                  ),
                                  if (state.paymentProcessResponse!
                                          .invoicesResponse!.taxes !=
                                      null)
                                    ...List.generate(
                                        state
                                            .paymentProcessResponse!
                                            .invoicesResponse!
                                            .taxes
                                            .length, (index) {
                                      return CustomBillDetailsRow(
                                          subStatusBill: state
                                              .paymentProcessResponse!
                                              .invoicesResponse!
                                              .taxes[index]["name"],
                                          price: Formatter.formatPrice(
                                            state
                                                .paymentProcessResponse!
                                                .invoicesResponse!
                                                .taxes[index]["tax_value"],
                                          ));
                                    }),
                                  // CustomBillDetailsRow(
                                  //   subStatusBill:
                                  //       AppLocalizations.of(context)!.tax,
                                  //   price: state.paymentProcessResponse!
                                  //               .invoicesResponse!.tax !=
                                  //           null
                                  //       ? Formatter.formatPrice(
                                  //           state.paymentProcessResponse!
                                  //               .invoicesResponse!.tax!,
                                  //         )
                                  //       : AppValueConst.defaultInvoiceValue
                                  //           .toString(),
                                  // ),
                                  CustomBillDetailsRow(
                                    subStatusBill: AppLocalizations.of(context)!
                                        .additional_discount,
                                    price: state
                                                .paymentProcessResponse!
                                                .invoicesResponse!
                                                .extraDiscount !=
                                            null
                                        ? Formatter.formatPrice(state
                                            .paymentProcessResponse!
                                            .invoicesResponse!
                                            .extraDiscount!)
                                        : AppValueConst.defaultInvoiceValue
                                            .toString(),
                                  ),
                                  CustomBillDetailsRow(
                                    colorText: ColorManager.primaryGreen,
                                    subStatusBill:
                                        AppLocalizations.of(context)!.total,
                                    price: state.paymentProcessResponse!
                                                .invoicesResponse!.total !=
                                            null
                                        ? Formatter.formatPrice(
                                            state.paymentProcessResponse!
                                                .invoicesResponse!.total!,
                                          )
                                        : AppValueConst.defaultInvoiceValue
                                            .toString(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTotalPrice(
                  title: AppLocalizations.of(context)!
                      .total_price
                      .replaceAll(":", ""),
                  totoalPrice:
                      state.paymentProcessResponse!.invoicesResponse!.total !=
                              null
                          ? Formatter.formatPrice(
                              state.paymentProcessResponse!.invoicesResponse!
                                  .total!,
                            )
                          : AppValueConst.defaultInvoiceValue.toString(),
                  onCompletePayment: () {
                    // paymentBloc.add(const ProceedToCheckout());
                    ConfirmPaymentOrderDialog().openDialog(
                      context,
                      AppLocalizations.of(context)!
                          .would_you_like_to_confirm_your_order,
                      AppLocalizations.of(context)!
                          .you_can_proceed_with_your_order_after_confirmation_from_my_order_list,
                      onTap: () {
                        print('!!!!!!!!');
                        print(context.read<BasketBloc>().state.productList!);
                        print('!!!!!!!!!');
                        if (myOrderBloc != null) {
                          paymentBloc.add(
                            CreateOrder(
                              idBasket,
                              productList: myOrderBloc!.productDetailsList,
                              invoicesParams: InvoicesParams(
                                couponId: state.couponId,
                                time: state.time,
                                notes: noteController.text,
                                deliveryMethodId: state.id!,
                                userAddressId: context
                                    .read<LocationBloc>()
                                    .state
                                    .addressCurrent
                                    .id!,
                              ),
                            ),
                          );
                        } else {
                          paymentBloc.add(
                            CreateOrder(
                              idBasket,
                              productList:
                                  context.read<BasketBloc>().state.productList!,
                              invoicesParams: InvoicesParams(
                                couponId: state.couponId,
                                time: state.time,
                                notes: noteController.text,
                                deliveryMethodId: state.id!,
                                userAddressId: context
                                    .read<LocationBloc>()
                                    .state
                                    .addressCurrent
                                    .id!,
                              ),
                            ),
                          );
                        }
                      },
                    );
                    // if (myOrderBloc != null) {
                    //   paymentBloc.add(
                    //     CreateOrder(
                    //       idBasket,
                    //       productList: myOrderBloc!.productDetailsList,
                    //       invoicesParams: InvoicesParams(
                    //         couponId: state.couponId,
                    //         time: state.time,
                    //         notes: noteController.text,
                    //         deliveryMethodId: state.id!,
                    //         userAddressId: context.read<LocationBloc>().state.addressCurrent.id!,
                    //       ),
                    //     ),
                    //   );
                    // }
                    // else {
                    //
                    //   paymentBloc.add(
                    //     CreateOrder(
                    //       idBasket,
                    //       productList: context.read<BasketBloc>().state.productList!,
                    //       invoicesParams: InvoicesParams(
                    //         couponId: state.couponId,
                    //         time: state.time,
                    //         notes: noteController.text,
                    //         deliveryMethodId:
                    //         state.id!,
                    //         userAddressId: context
                    //             .read<LocationBloc>()
                    //             .state
                    //             .addressCurrent
                    //             .id!,
                    //       ),
                    //     ),
                    //   );
                    // }
                  },
                  onCompleteShopping: () {
                    context.read<HomeBloc>().currentIndex = 0;
                    AppRouter.pushReplacement(context, const HomeScreen());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CustomOrderTypeContainer buildCustomOrderTypeContainer(
    BuildContext context,
    LocationState locationState,
    DeliveryMethodResponse item,
    PaymentState state,
    MyOrderBloc? myOrderBloc,
  ) {
    return CustomOrderTypeContainer(
      idMethodeType: item.id,
      isChosenLocation:
          context.read<LocationBloc>().state.addressCurrent.latitude != null,
      userAddressId: locationState.addressCurrent.id ?? 0,
      deliveryField: item,
      isSelected: state.deliveryMethodChosenList
          .any((element) => element.id == item.id),
      deliveryCost:
          "${AppLocalizations.of(context)!.delivery_cost} ${item.deliveryPrice} ${AppLocalizations.of(context)!.curruncy} ",
      image: ImageManager.dateTimeImage,
      text:
          "${item.deliveryName} (${item.deliveryTime} ${AppLocalizations.of(context)!.minutes_2}) ",
      onTap: () {
        if (!state.deliveryMethodChosenList
            .any((element) => element.id == item.id)) {
          if (context.read<LocationBloc>().state.addressCurrent.latitude !=
              null) {
            paymentBloc.add(ToggleDeliveryMethod(deliveryMethodData: item));
            if (myOrderBloc != null &&
                myOrderBloc.productDetailsList.isNotEmpty) {
              paymentBloc.add(
                GetInvoicesDetails(
                  invoicesParams: InvoicesParams(
                    time: state.time,
                    notes: noteController.text,
                    deliveryMethodId: item.id,
                    userAddressId: locationState.addressCurrent.id!,
                  ),
                  productList: myOrderBloc.productDetailsList,
                  id: item.id,
                ),
              );
            } else {
              paymentBloc.add(
                GetInvoicesDetails(
                  invoicesParams: InvoicesParams(
                    time: state.time,
                    notes: noteController.text,
                    deliveryMethodId: item.id,
                    userAddressId: locationState.addressCurrent.id!,
                  ),
                  productList: context.read<BasketBloc>().state.productList,
                  id: item.id,
                ),
              );
            }

            if (item.isSchedule) {
              showDialog(
                context: context,
                builder: (unContext) => CustomDatePicker(
                  paymentBloc: paymentBloc,
                ),
              );
            }
          }
        }
      },
    );
  }

  bool checkIsOpening(BuildContext context) {
    try {
      DateTime dateTime = DateTime.now();

      List<String> endTime = (context
              .read<SettingBloc>()
              .settingModel!
              .data!
              .openingTimes!
              .endTime)
          .split(":");
      List<String> startTime = (context
              .read<SettingBloc>()
              .settingModel!
              .data!
              .openingTimes!
              .startTime)
          .split(":");

      if (int.parse(endTime[0]) > dateTime.hour &&
          int.parse(startTime[0]) < dateTime.hour) {
        return true;
      } else if (int.parse(endTime[0]) == dateTime.hour) {
        if (int.parse(endTime[1]) > dateTime.minute) {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
