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
          const CustomAppBarScreen(sectionName: "الدفع"),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Text(
                      "قد يختلف شكل المنتج النهائي والسعر حسب الوزن  ! ",
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
                        "العنوان",
                        style: getMoreBoldStyle(
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
                        "التوصيل",
                        style: getMoreBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const CutomOrderTypeContiner(
                        deliverycost: "التوصيل",
                        image: ImageManager.dateTimeImage,
                        text: "عرض حالة الطلب",
                        orderState: OrderStates.normalOrder,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CutomOrderTypeContiner(
                          deliverycost: "adfs",
                          image: ImageManager.dateTimeImage,
                          text: "عرض  الطلب",
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
                        "الدفع",
                        style: getMoreBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const CustomPaymentStatusContiner(
                        image: ImageManager.farmySmile,
                        text: "الدفع عند الاستلام",
                        paymentState: PaymentStates.cashPayment,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomPaymentStatusContiner(
                        image: ImageManager.farmySmile,
                        text: "محفظة فارمي",
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
                        "كود حسم",
                        style: getMoreBoldStyle(
                            color: ColorManager.primaryGreen,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomDiscountCodeContiner(
                              subjectText: "كود حسم",
                            )),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: CustomDiscountCodeContiner(
                              subjectText: "استبدال النقاط",
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
                      style:
                          getMoreBoldStyle(color: ColorManager.redForFavorite),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ملاحظات",
                        style: getMoreBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InputFieldAuth(
                        height: .30.sw,
                        width: 1.sw,
                        color: ColorManager.lightGray,
                        hintText: "اضافة ملاحظات على طلبك",
                        hintStyle:
                            getRegularStyle(color: ColorManager.grayForMessage),
                      )
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 11),
                  child: Column(
                    children: [
                      CustomBillDetailsRow(
                        subStatusBill: "المبلغ الاجمالي",
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill: "كود الحسم ",
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill: " رسوم التوصيل",
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        subStatusBill: "  الضريبة",
                        price: "2000",
                      ),
                      CustomBillDetailsRow(
                        colorText: ColorManager.primaryGreen,
                        subStatusBill: " الاجمالي",
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
