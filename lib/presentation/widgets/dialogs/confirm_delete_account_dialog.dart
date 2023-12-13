import 'package:flutter/material.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/sign_in_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/custom_dialog.dart';
import 'package:pharma/translations.dart';

class ConfirmDeleteAccountDialog {
  static void openDialog(BuildContext context, String? message) {
    dialogTransitionBuilder(
        context,
        _ConfirmDeleteAccountDialogBody(
          message: message!,
        ));
  }
}

class _ConfirmDeleteAccountDialogBody extends StatelessWidget {
  final String message;
  const _ConfirmDeleteAccountDialogBody({required this.message});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 40,
            ),
            child: Text(
              message,
              style: getBoldStyle(
                color: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: CustomButton(
              label: AppLocalizations.of(context)!.exit,
              onTap: () {
                AppRouter.pushAndRemoveAllStack(context, const SignInScreen());
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
