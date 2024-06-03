import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/reward/reward_coupons_fixed_value.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/translations.dart';

class CustomDiscountCodeContainer extends StatelessWidget {
  final String subjectText;
  final String imageUrl;
   String value="";
  final RewardCouponsFixedValueModel? rewardCouponsFixedValueModel;
  final MyOrderBloc? myOrderBloc;
  final PaymentBloc paymentBloc;
  final int? idBasket;
  final String notesText;

   CustomDiscountCodeContainer({
    super.key,
    required this.subjectText,
    required this.imageUrl,
    required this.rewardCouponsFixedValueModel,
    required this.myOrderBloc,
    required this.paymentBloc,
    required this.idBasket,
    required this.notesText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 61.h,
      child: Focus(
        onFocusChange: (e) {
          if(value!=''){
            if (paymentBloc.state.id != null) {
            paymentBloc.add(
              GetCoupon("", value),
            );
            if (myOrderBloc != null) {
              paymentBloc.add(
                GetInvoicesDetails(
                  productList: myOrderBloc!.productDetailsList,
                  invoicesParams: InvoicesParams(
                    couponCode: value,
                    time: paymentBloc.state.time,
                    notes: notesText,
                    deliveryMethodId: paymentBloc.state.id!,
                    userAddressId:
                    context.read<LocationBloc>().state.addressCurrent.id!,
                  ),
                ),
              );
            } else {
              paymentBloc.add(
                GetInvoicesDetails(
                  productList: context.read<BasketBloc>().state.productList!,
                  invoicesParams: InvoicesParams(
                    couponCode: value,
                    time: paymentBloc.state.time,
                    notes: notesText,
                    deliveryMethodId: paymentBloc.state.id!,
                    userAddressId:
                    context.read<LocationBloc>().state.addressCurrent.id!,
                  ),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "الرجاء اختيار نوع الطلب",
                    style: getRegularStyle(
                      color: ColorManager.white,
                      fontSize: FontSizeApp.s14,
                    ),
                  ),
                ),
                backgroundColor: ColorManager.primaryGreen,
              ),
            );
          }
        }
          },
        child: TextFormField(
          
          textAlignVertical: TextAlignVertical.top,
          onFieldSubmitted: (value) {
            if (paymentBloc.state.id != null) {
              paymentBloc.add(
                GetCoupon("", value),
              );
              if (myOrderBloc != null) {
                paymentBloc.add(
                  GetInvoicesDetails(
                    productList: myOrderBloc!.productDetailsList,
                    invoicesParams: InvoicesParams(
                      couponCode: value,
                      time: paymentBloc.state.time,
                      notes: notesText,
                      deliveryMethodId: paymentBloc.state.id!,
                      userAddressId:
                          context.read<LocationBloc>().state.addressCurrent.id!,
                    ),
                  ),
                );
              } else {
                paymentBloc.add(
                  GetInvoicesDetails(
                    productList: context.read<BasketBloc>().state.productList!,
                    invoicesParams: InvoicesParams(
                      couponCode: value,
                      time: paymentBloc.state.time,
                      notes: notesText,
                      deliveryMethodId: paymentBloc.state.id!,
                      userAddressId:
                          context.read<LocationBloc>().state.addressCurrent.id!,
                    ),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "الرجاء اختيار نوع الطلب",
                      style: getRegularStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeApp.s14,
                      ),
                    ),
                  ),
                  backgroundColor: ColorManager.primaryGreen,
                ),
              );
            }
          },
          onChanged: (e) {
            value = e;
          },
        
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.discount_code,
            hintStyle: getBoldStyle(
              color: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s11.sp,
            )!,
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 24.w, left: 18.w),
              child: Image.asset(
                imageUrl,
                height: 39.h,
                width: 39.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.grayForMessage,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.grayForMessage,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
