import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomChangeOnTheOrder extends StatelessWidget {
  final String changeText;
  final bool isSelected;
  final Function() onTab;

  const CustomChangeOnTheOrder(
      {super.key,
      required this.changeText,
      required this.onTab,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          log(state.toString());
          return Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 9),
              Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? ColorManager.primaryGreen
                        : ColorManager.grayForSearch),
              ),
              const SizedBox(width: 9),
              Text(
                changeText,
                style: getRegularStyle(
                    color: ColorManager.grayForMessage,
                    fontSize: FontSizeApp.s14),
              ),
            ],
          );
        },
      ),
    );
  }
}
