import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_bill_details_row.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_discount_code_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_note_on_the_order_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_order_scheduling.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_order_type_continer.dart';
import 'package:pharma/presentation/screens/payment/widgets/custom_payment_status_continer.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/select_location.dart';
import 'package:pharma/translations.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>(),
      child: const PaymentBody(),
    );
  }
}

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.payment),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Text(AppLocalizations.of(context)!.payment_statment,
                      style: getRegularStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s16)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
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
                      CutomOrderTypeContiner(
                        deliverycost:
                            "${AppLocalizations.of(context)!.delivery_cost}25000",
                        image: ImageManager.dateTimeImage,
                        text:
                            "${AppLocalizations.of(context)!.normal_request} (30 دقيقة)",
                        orderState: OrderStates.normalOrder,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CutomOrderTypeContiner(
                          deliverycost:
                              "${AppLocalizations.of(context)!.delivery_cost}35000.00",
                          image: ImageManager.dateTimeImage,
                          text:
                              "${AppLocalizations.of(context)!.urgent_request} (15 دقيقة)",
                          orderState: OrderStates.urgentOrder,
                        ),
                      ),
                      const CustomOrderScheduling(
                          deliverycost: "كلفة التوصيل 25.000 ل.س",
                          image: ImageManager.dateTimeImage)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.payment,
                        style: getBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomPaymentStatusContiner(
                        image: ImageManager.farmySmile,
                        text: AppLocalizations.of(context)!.cash_payment,
                        paymentState: PaymentStates.cashPayment,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomPaymentStatusContiner(
                        image: ImageManager.farmySmile,
                        text: AppLocalizations.of(context)!.farmy_wallet,
                        paymentState: PaymentStates.farmyWallet,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.hasm_code,
                        style: getBoldStyle(
                            color: ColorManager.primaryGreen,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomDiscountCodeContiner(
                              imageUrl: ImageManager.codeDiscount,
                              subjectText:
                                  AppLocalizations.of(context)!.hasm_code,
                            )),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: CustomDiscountCodeContiner(
                              isReplacePoint: true,
                              imageUrl: ImageManager.replacePoint,
                              subjectText:
                                  AppLocalizations.of(context)!.redeem_points,
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لقد حصلت على حسم 5000 ل.س من مجمل الفاتورة",
                      style: getBoldStyle(color: ColorManager.redForFavorite),
                    ),
                  ],
                ),
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
                        hintText: AppLocalizations.of(context)!.add_notes,
                        hintStyle:
                            getRegularStyle(color: ColorManager.grayForMessage),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      CustomNoteOnTheOrder(
                        noteText: 'عدم رن  الجرس',
                      ),
                      CustomNoteOnTheOrder(
                        noteText: 'الاتصال بي عند الوصول',
                      ),
                      CustomNoteOnTheOrder(
                        noteText: "التواصل عند  عدم توفر منتج ما",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 38, left: 38, top: 15),
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
                  padding:
                      const EdgeInsets.only(right: 21, left: 21, bottom: 11),
                  child: Column(
                    children: [
                      CustomBillDetailsRow(
                        subStatusBill:
                            AppLocalizations.of(context)!.total_amount,
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill: AppLocalizations.of(context)!.hasm_code,
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill:
                            AppLocalizations.of(context)!.deliverycharges,
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill:
                            AppLocalizations.of(context)!.deliverycharges,
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        colorText: ColorManager.primaryGreen,
                        subStatusBill: AppLocalizations.of(context)!.total,
                        price: "2000",
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
