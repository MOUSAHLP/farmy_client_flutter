
import 'package:flutter/material.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import '../../../core/app_router/dialog_transition_builder.dart';
import '../../../translations.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../screens/auth_screen/account_screen.dart';
import '../custom_button.dart';
import 'custom_dialog.dart';

class LogoutConfirmationDialog {
  static Future<bool> handle(BuildContext context) async {
    dialogTransitionBuilder(context, const _LogoutConfirmationDialog());
    return false;
  }
}

class _LogoutConfirmationDialog extends StatelessWidget {
  const _LogoutConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      icon: Icons.logout,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 40,
            ),
            child: Text(
              AppLocalizations.of(context).confimSignOut,
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
                    label:AppLocalizations.of(context).stay,
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
                    label: AppLocalizations.of(context).exit,
                    fillColor: Colors.red,
                    onTap: () {

                      AppRouter.pushAndRemoveAllStack(context, const AccountScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
