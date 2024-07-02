import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/order_tracking_screen/order_tracking_screen.dart';

import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/custom_dialog.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../core/app_router/app_router.dart';

class ConfirmPaymentOrderDialog {
  static final ConfirmPaymentOrderDialog _loadingDialog =
      ConfirmPaymentOrderDialog._internal();

  factory ConfirmPaymentOrderDialog() {
    return _loadingDialog;
  }

  ConfirmPaymentOrderDialog._internal();

  bool _isShown = false;

  void closeDialog(BuildContext context) {
    if (_isShown) {
      AppRouter.pop(context);
      _isShown = false;
    }
  }

  void openDialog(BuildContext context, String? message, String? supMessage,
      {required Function() onTap}) {
    _isShown = true;
    dialogTransitionBuilder(
        context,
        _ConfirmPaymentOrderDialogBody(
          message: message!,
          supMessage: supMessage!,
          onTap: onTap,
        )).whenComplete(() => _isShown = false);
  }
}

class _ConfirmPaymentOrderDialogBody extends StatefulWidget {
  final String message;
  final String supMessage;
  final Function() onTap;

  const _ConfirmPaymentOrderDialogBody(
      {required this.message, required this.onTap, required this.supMessage});

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
            child: Lottie.asset(
              LottieManager.completePayment,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                    // ..duration = composition.duration
                    .forward();
              },
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: getBoldStyle(
              color: ColorManager.grayForSearchProduct,
              fontSize: FontSizeApp.s12.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            textAlign: TextAlign.center,
            widget.supMessage,
            style: getBoldStyle(
              color: ColorManager.grayForSearchProduct,
              fontSize: FontSizeApp.s12.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: AppLocalizations.of(context)!.confirm,
                    fillColor: ColorManager.lightGreen,
                    onTap: widget.onTap,
                    // onTap: () {
                    //   ConfirmPaymentOrderDialog().closeDialog(context);
                    // },
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
                    label: AppLocalizations.of(context)!.back,
                    onTap: () {
                      ConfirmPaymentOrderDialog().closeDialog(context);
                    },
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
