
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_bill_details_row.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_note_on_the_order_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_order_type_continer.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_total_price.dart';
import 'package:pharma/presentation/widgets/select_location.dart';
import 'package:pharma/translations.dart';

import '../../widgets/dialogs/confirm_payment_order_dialog.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentProcessResponse paymentProcessResponse;
  const PaymentScreen({super.key, required this.paymentProcessResponse});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>(),
      child: PaymentBody(paymentProcessResponse: paymentProcessResponse),
    );
  }
}

class PaymentBody extends StatelessWidget {
  final PaymentProcessResponse paymentProcessResponse;
  const PaymentBody({super.key, required this.paymentProcessResponse});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
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
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: Text(
                                AppLocalizations.of(context)!.payment_statment,
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
                                const SelectLocation(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.conduction,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: FontSizeApp.s14),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                for (var item in paymentProcessResponse
                                    .deleveryMethodList!)
                                  CutomOrderTypeContiner(
                                    delveryField: item,
                                    isSelected: state.deleveryMethodChossenList
                                        .any(
                                            (element) => element.id == item.id),
                                    onTap: () {
                                      context.read<PaymentBloc>().add(
                                          ToogleDeleveryMethod(
                                              deleveryMethodData: item));
                                    },
                                    deliverycost:
                                        "${AppLocalizations.of(context)!.delivery_cost}  ${item.deleveyPrice}",
                                    image: ImageManager.dateTimeImage,
                                    text:
                                        "${item.deleveryName} (${item.deleveytime})",
                                  ),
                              ],
                            ),
                          ),

                          //todo
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 21),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         AppLocalizations.of(context)!.payment,
                          //         style: getBoldStyle(
                          //             color: ColorManager.grayForMessage,
                          //             fontSize: FontSizeApp.s14),
                          //       ),
                          //       const SizedBox(
                          //         height: 4,
                          //       ),
                          //       CustomPaymentStatusContiner(
                          //         image: ImageManager.farmySmile,
                          //         text: AppLocalizations.of(context)!
                          //             .cash_payment,
                          //         paymentState: PaymentStates.cashPayment,
                          //       ),
                          //       const SizedBox(
                          //         height: 12,
                          //       ),
                          //       CustomPaymentStatusContiner(
                          //         image: ImageManager.farmySmile,
                          //         text: AppLocalizations.of(context)!
                          //             .farmy_wallet,
                          //         paymentState: PaymentStates.farmyWallet,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //todo
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 21, vertical: 12),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         AppLocalizations.of(context)!.hasm_code,
                          //         style: getBoldStyle(
                          //             color: ColorManager.primaryGreen,
                          //             fontSize: FontSizeApp.s14),
                          //       ),
                          //       const SizedBox(
                          //         height: 8,
                          //       ),

                          //       // Padding(
                          //       //   padding:
                          //       //       const EdgeInsets.symmetric(horizontal: 5),
                          //       //   child: Row(
                          //       //     children: [
                          //       //       Expanded(
                          //       //           child: CustomDiscountCodeContiner(
                          //       //         imageUrl: ImageManager.codeDiscount,
                          //       //         subjectText:
                          //       //             AppLocalizations.of(context)!
                          //       //                 .hasm_code,
                          //       //       )),
                          //       //       const SizedBox(
                          //       //         width: 4,
                          //       //       ),
                          //       //       Expanded(
                          //       //           child: CustomDiscountCodeContiner(
                          //       //         isReplacePoint: true,
                          //       //         imageUrl: ImageManager.replacePoint,
                          //       //         subjectText:
                          //       //             AppLocalizations.of(context)!
                          //       //                 .redeem_points,
                          //       //       ))
                          //       //     ],
                          //       //   ),
                          //       // )
                          //     ],
                          //   ),
                          // ),
                          //  todo
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "لقد حصلت على حسم 5000 ل.س من مجمل الفاتورة",
                          //       style: getBoldStyle(
                          //           color: ColorManager.redForFavorite),
                          //     ),
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.reviews,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: FontSizeApp.s14),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                InputFieldAuth(
                                  maxLines: 5,
                                  minLines: 5,
                                  height: .30.sw,
                                  width: 1.sw,
                                  color: ColorManager.lightGray,
                                  hintText:
                                      AppLocalizations.of(context)!.add_notes,
                                  hintStyle: getRegularStyle(
                                      color: ColorManager.grayForMessage),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 21, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.requiredChange,
                                  style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s14),
                                ),
                                // SizedBox(
                                //   width: 1.sw,
                                //   child: GridView.builder(
                                //     physics: const NeverScrollableScrollPhysics(),
                                //     gridDelegate:
                                //         const SliverGridDelegateWithFixedCrossAxisCount(
                                //             crossAxisSpacing: 0,
                                //             mainAxisSpacing: 0,
                                //             mainAxisExtent: 30,
                                //             crossAxisCount: 3),
                                //     itemBuilder: (context, index) {
                                //       return Container(
                                //         width: 82,
                                //         color: Colors.amber,
                                //       );
                                //     },
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i <
                                        paymentProcessResponse
                                            .deleveryAttributesList!.length;
                                    i++)
                                  CustomNoteOnTheOrder(
                                    onTab: () {
                                      if (context
                                          .read<PaymentBloc>()
                                          .state
                                          .attrbiuteChossenList
                                          .any((element) =>
                                              element.id ==
                                              paymentProcessResponse
                                                  .deleveryAttributesList![i]
                                                  .id)) {
                                        context.read<PaymentBloc>().add(
                                            RemoveFromChossenList(
                                                attrbiuteData:
                                                    paymentProcessResponse
                                                            .deleveryAttributesList![
                                                        i]));
                                      } else {
                                        context.read<PaymentBloc>().add(
                                            AddToChossenAttrbiuteList(
                                                attrbiuteData:
                                                    paymentProcessResponse
                                                            .deleveryAttributesList![
                                                        i]));
                                      }
                                    },
                                    isSelected: context
                                            .read<PaymentBloc>()
                                            .state
                                            .attrbiuteChossenList
                                            .any((element) =>
                                                element.id ==
                                                paymentProcessResponse
                                                    .deleveryAttributesList![i]
                                                    .id)
                                        ? true
                                        : false,
                                    noteText: paymentProcessResponse
                                        .deleveryAttributesList![i]
                                        .nameDeleveryAttribute!,
                                  ),
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
                                          color: ColorManager.grayForMessage,
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
                                    subStatusBill: AppLocalizations.of(context)!
                                        .total_amount,
                                    price: paymentProcessResponse
                                                .invociesResponse!.total !=
                                            null
                                        ? paymentProcessResponse
                                            .invociesResponse!.total
                                            .toString()
                                        : AppVAlueConst.defalutInvoiceValue),
                                CustomBillDetailsRow(
                                  subStatusBill:
                                      AppLocalizations.of(context)!.hasm_code,
                                  price: paymentProcessResponse
                                              .invociesResponse!.coponValue !=
                                          null
                                      ? paymentProcessResponse
                                          .invociesResponse!.coponValue
                                          .toString()
                                      : AppVAlueConst.defalutInvoiceValue,
                                ),
                                CustomBillDetailsRow(
                                  subStatusBill: AppLocalizations.of(context)!
                                      .deliverycharges,
                                  price: state.deleveryCost ?? 0.toString(),
                                ),
                                CustomBillDetailsRow(
                                    subStatusBill: AppLocalizations.of(context)!
                                        .tax,
                                    price: paymentProcessResponse
                                                .invociesResponse!.tax !=
                                            null
                                        ? paymentProcessResponse
                                            .invociesResponse!.tax
                                            .toString()
                                        : AppVAlueConst.defalutInvoiceValue),
                                CustomBillDetailsRow(
                                    colorText: ColorManager.primaryGreen,
                                    subStatusBill:
                                        AppLocalizations.of(context)!.total,
                                    price: paymentProcessResponse
                                                .invociesResponse!.total !=
                                            null
                                        ? (paymentProcessResponse
                                                    .invociesResponse!.total! +
                                                int.parse(state.deleveryCost!))
                                            .toString()
                                        : AppVAlueConst.defalutInvoiceValue)
                              ],
                            ),
                          )
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
                totoalPrice: paymentProcessResponse.invociesResponse!.total !=
                        null
                    ? (Formatter.formatPrice(
                            paymentProcessResponse.invociesResponse!.total! +
                                int.parse(state.deleveryCost!)))
                        .toString()
                    : AppVAlueConst.defalutInvoiceValue,
                onCompletePayment: () {
                  ConfirmPaymentOrderDialog.openDialog(context,
                      AppLocalizations.of(context)!.orderSuccesfulyComplete);
                },
                onCompleteShopping: () {},
              )
            ],
          ));
        },
      ),
    );
  }
}
