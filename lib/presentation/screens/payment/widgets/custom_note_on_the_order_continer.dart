import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomNoteOnTheOrder extends StatelessWidget {
  final String noteText;
  final bool isSelected;
  final Function() onTab;
  const CustomNoteOnTheOrder(
      {super.key,
      required this.noteText,
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
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? ColorManager.primaryGreen
                        : ColorManager.grayForMessage),
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                noteText,
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
