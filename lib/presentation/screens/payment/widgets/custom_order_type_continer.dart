import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/payment/widgets/selected_continer.dart';

import '../../../../bloc/payment_bloc/payment_bloc.dart';

class CutomOrderTypeContiner extends StatelessWidget {
  final OrderStates orderState;
  final String image;
  final String text;
  final String deliverycost;
  const CutomOrderTypeContiner(
      {super.key,
      required this.orderState,
      required this.deliverycost,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context
                .read<PaymentBloc>()
                .add(OrderEvent(orderStates: orderState));
          },
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
                        style: getBoldStyle(
                            color: ColorManager.grayForMessage),
                      ),
                    ),
                    BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        return SlectedContiner(
                          onPreased: () {
                            context
                                .read<PaymentBloc>()
                                .add(OrderEvent(orderStates: orderState));
                          },
                          color: state.orderState == orderState
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
        Text(
          deliverycost,
          style: getBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s14)!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
