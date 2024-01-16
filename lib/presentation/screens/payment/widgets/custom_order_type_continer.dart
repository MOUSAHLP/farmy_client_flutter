import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/payment/widgets/selected_continer.dart';

import '../../../../bloc/payment_bloc/payment_bloc.dart';

class CutomOrderTypeContiner extends StatelessWidget {
  final bool isSelected;
  final bool isChossenLocation;
  final DeleveryMethodResponse delveryField;
  final int userAddressid;
  final String image;
  final String text;
  final String deliverycost;
  final Function() onTap;
  const CutomOrderTypeContiner(
      {super.key,
      required this.isSelected,
      required this.userAddressid,
      required this.isChossenLocation,
      required this.delveryField,
      required this.onTap,
      required this.deliverycost,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorManager.grayForMessage,
                  width: 1,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 19),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          image,
                          height: 34,
                          width: 34,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: getBoldStyle(color: ColorManager.grayForMessage),
                      ),
                    ),
                    BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        return SlectedContiner(
                          onPreased: () {
                            if (!isSelected) {
                              if (isChossenLocation) {
                                context.read<PaymentBloc>().add(
                                    ToogleDeleveryMethod(
                                        deleveryMethodData: delveryField));

                                context.read<PaymentBloc>().add(
                                    GetInvoicesDetails(
                                        invoicesParms: InvoicesParms(
                                            deliveryMethodId: delveryField.id!,
                                            userAddressid: userAddressid),
                                        prductList: context
                                            .read<BasketBloc>()
                                            .state
                                            .prductList));
                              }
                            }
                          },
                          color: isSelected
                              ? ColorManager.primaryGreen
                              : ColorManager.greyForUnSleactedItem,
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        isChossenLocation
            ? Text(
                deliverycost,
                style: getBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s14)!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            : Text(
                "please chosse you location",
                style: getBoldStyle(
                        color: ColorManager.redForFavorite,
                        fontSize: FontSizeApp.s14)!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
