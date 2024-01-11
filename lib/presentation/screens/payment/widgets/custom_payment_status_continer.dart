import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/payment/widgets/selected_continer.dart';

class CustomPaymentStatusContiner extends StatelessWidget {
  final PaymentStates paymentState;
  final String image;
  final String text;
  const CustomPaymentStatusContiner(
      {super.key,
      required this.paymentState,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<PaymentBloc>()
            .add(ChoosePaymentStatusEvent(paymentState: paymentState));
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    context.read<PaymentBloc>().add(
                        ChoosePaymentStatusEvent(paymentState: paymentState));
                  },
                  color: state.paymentState == paymentState
                      ? ColorManager.primaryGreen
                      : ColorManager.greyForUnSleactedItem,
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
