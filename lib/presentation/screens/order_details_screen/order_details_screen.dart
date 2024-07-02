import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/details_order_bloc/details_order_event.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/screens/order_details_screen/widgets/card_details_order.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_bill_details_row.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/confirm_payment_order_dialog.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../../bloc/details_order_bloc/details_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/formatter.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../base_screen/base_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int id;
  final bool isEdit;
  final bool isDelivered;
  final bool isDelivery;

  const OrderDetailsScreen({
    super.key,
    required this.id,
    this.isEdit = false,
    this.isDelivered = false,
    this.isDelivery = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<DetailsOrderBloc>()..add(ShowDetailsOrder(id: id));
      },
      child: OrderDetailsBody(
        id: id,
        isEdit: isEdit,
        isDelivery: isDelivery,
        isDelivered: isDelivered,
      ),
    );
  }
}

class OrderDetailsBody extends StatelessWidget {
  final int id;
  final bool isEdit;
  final bool isDelivered;
  final bool isDelivery;

  const OrderDetailsBody(
      {super.key,
      required this.id,
      this.isEdit = false,
      this.isDelivered = false,
      this.isDelivery = false});

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      backgroundColor: Colors.white,
      appbarTitle: AppLocalizations.of(context)!.order_details,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                isDelivered
                    ? AppLocalizations.of(context)!.return_statment
                    : AppLocalizations.of(context)!.payment_statment,
                style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s16,
                ),
              ),
            ),
            BlocConsumer<DetailsOrderBloc, DetailsOrderState>(
              listener: (context, state) {
                if (state.isLoadingEdite) {
                  LoadingDialog().openDialog(context);
                } else {
                  LoadingDialog().closeDialog(context);
                }
                if (state.errorEdit != "") {
                  ErrorDialog.openDialog(context, state.errorEdit);
                }
                if (state.successEdit) {}
              },
              builder: (context, state) {
                if (state.screenStates == ScreenStates.loading) {
                  return const Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: ColorManager.primaryGreen,
                  )));
                } else if (state.screenStates == ScreenStates.error) {
                  return Expanded(
                    child: CustomErrorScreen(
                      onTap: () {
                        context
                            .read<DetailsOrderBloc>()
                            .add(ShowDetailsOrder(id: id));
                      },
                      titleError: state.error,
                    ),
                  );
                }
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    CardDetailsOrder(
                                  product: state.productList[index],
                                  isEdit: isEdit,
                                  isDelivered: isDelivered,
                                ),
                                itemCount: state.productList.length,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (state.invoice != {})
                                Column(
                                  children: [
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .total_amount,
                                      price: state.invoice != {}
                                          ? Formatter.formatPrice(
                                              state.invoice!["subTotal"]!)
                                          : "",
                                    ),
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .hasm_code,
                                      price: Formatter.formatPrice(
                                          state.invoice!["couponDiscount"]!),
                                    ),
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .deliverycharges,
                                      price: Formatter.formatPrice(
                                          state.invoice!["deliveryFee"]),
                                    ),
                                    if (state.invoice!["taxes"].length > 0)
                                      ...List.generate(
                                          state.invoice!["taxes"].length,
                                          (index) {
                                        return CustomBillDetailsRow(
                                            subStatusBill:
                                                state.invoice!["taxes"][index]
                                                    ["name"],
                                            price: Formatter.formatPrice(
                                              state.invoice!["taxes"][index]
                                                  ["tax_value"],
                                            ));
                                      }),
                                    // CustomBillDetailsRow(
                                    //   subStatusBill:
                                    //       AppLocalizations.of(context)!.tax,
                                    //   price: Formatter.formatPrice(
                                    //     state.invoice!["tax"],
                                    //   ),
                                    // ),
                                    CustomBillDetailsRow(
                                      subStatusBill:
                                          AppLocalizations.of(context)!
                                              .additional_discount,
                                      price: Formatter.formatPrice(
                                          state.invoice!["extra_discount"]),
                                    ),
                                    CustomBillDetailsRow(
                                      colorText: ColorManager.primaryGreen,
                                      subStatusBill:
                                          AppLocalizations.of(context)!.total,
                                      price: Formatter.formatPrice(
                                          state.invoice!["total"]),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      state.productList.isEmpty
                          ? const SizedBox()
                          : Container(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22)),
                                  boxShadow: [ColorManager.shadowGaryUp]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .order_total_price,
                                    style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          Formatter.formatPrice(
                                            state.total,
                                          ),
                                          style: getBoldStyle(
                                              color: ColorManager.primaryGreen,
                                              fontSize: 24)),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                          AppLocalizations.of(context)!
                                              .curruncy,
                                          style: getBoldStyle(
                                                  color:
                                                      ColorManager.primaryGreen,
                                                  fontSize: 15)!
                                              .copyWith(height: 1))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27, vertical: 9),
                                    child: Row(
                                      children: [
                                        if (isDelivered)
                                          Expanded(
                                            child: CustomButton(
                                              label:
                                                  AppLocalizations.of(context)!
                                                      .confirm,
                                              fillColor:
                                                  ColorManager.primaryGreen,
                                              onTap: () {
                                                ConfirmPaymentOrderDialog().openDialog(
                                                    context,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .would_you_like_to_remove_the_selected_products_from_your_order,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .when_you_remove_the_selected_products_the_new_invoice_will_be_calculated,
                                                    onTap: () {
                                                  try {
                                                    ConfirmPaymentOrderDialog()
                                                        .closeDialog(context);

                                                    if (context
                                                        .read<
                                                            DetailsOrderBloc>()
                                                        .returnedProducts
                                                        .isNotEmpty) {
                                                      context
                                                          .read<
                                                              DetailsOrderBloc>()
                                                          .add(
                                                              OrderReturnProducts(
                                                                  id: id));
                                                    }
                                                  } catch (e) {}
                                                });
                                              },
                                            ),
                                          ),
                                        isEdit
                                            ? Expanded(
                                                child: CustomButton(
                                                  label: AppLocalizations.of(
                                                          context)!
                                                      .save_edits,
                                                  fillColor:
                                                      ColorManager.primaryGreen,
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            DetailsOrderBloc>()
                                                        .add(EditDetailsOrder(
                                                            id: id));
                                                  },
                                                ),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            label: AppLocalizations.of(context)!
                                                .back,
                                            fillColor:
                                                ColorManager.primaryGreen,
                                            labelColor: Colors.white,
                                            onTap: () {
                                              AppRouter.pop(context);
                                            },
                                          ),
                                        ),
                                        isEdit
                                            ? const SizedBox()
                                            : const SizedBox(
                                                width: 16,
                                              ),
                                        !isDelivery
                                            ? const SizedBox()
                                            : Expanded(
                                                child: CustomButton(
                                                  label: AppLocalizations.of(
                                                          context)!
                                                      .download_pdf,
                                                  fillColor: Colors.white,
                                                  isFilled: true,
                                                  borderColor:
                                                      ColorManager.primaryGreen,
                                                  labelColor:
                                                      ColorManager.primaryGreen,
                                                  onTap: () {
                                                    launchUrl(
                                                      Uri.parse(state.urlPdf),
                                                      mode: LaunchMode
                                                          .externalApplication,
                                                    );
                                                  },
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      //  drawer: const CustomAppDrawer(),
    );
  }
}
