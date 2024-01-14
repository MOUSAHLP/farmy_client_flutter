import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/custom_dialog.dart';
import 'package:pharma/translations.dart';

import '../../../core/app_router/app_router.dart';

class ConfirmPaymentOrderDialog {
  static void openDialog(BuildContext context, String? message) {
    dialogTransitionBuilder(
        context,
        _ConfirmPaymentOrderDialogBody(
          message: message!,
        ));
  }
}

class _ConfirmPaymentOrderDialogBody extends StatefulWidget {
  final String message;
  const _ConfirmPaymentOrderDialogBody({required this.message});

  @override
  State<_ConfirmPaymentOrderDialogBody> createState() =>
      _ConfirmPaymentOrderDialogBodyState();
}

class _ConfirmPaymentOrderDialogBodyState
    extends State<_ConfirmPaymentOrderDialogBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration =
        const Duration(milliseconds: 1000); // Set your desired duration
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 50,
              width: 50,
              child: Lottie.asset(LottieManager.completePayment,
                  controller: _controller, onLoaded: (composition) {
                _controller
                    // ..duration = composition.duration
                    .forward();
              })),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10,
            ),
            child: Text(
              widget.message,
              style: getBoldStyle(
                color: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: AppLocalizations.of(context)!.order_Tracking,
                    fillColor: ColorManager.lightGreen,
                    onTap: () {
                      AppRouter.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                    borderColor: ColorManager.primaryGreen,
                    labelColor: ColorManager.primaryGreen,
                    isFilled: true,
                    fillColor: ColorManager.white,
                    label: AppLocalizations.of(context)!.exit,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
