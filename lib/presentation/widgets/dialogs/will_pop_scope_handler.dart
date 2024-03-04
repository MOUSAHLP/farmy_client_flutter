import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';

import '../../../core/app_router/app_router.dart';
import '../../../core/app_router/dialog_transition_builder.dart';
import '../../../translations.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';

import 'custom_dialog.dart';

class WillPopScopeHandler {
  static Future<bool> handle(BuildContext context) async {
    dialogTransitionBuilder(context, const _ExitAppDialog());
    return false;
  }
}

class _ExitAppDialog extends StatelessWidget {
  const _ExitAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      icon: Icons.exit_to_app_rounded,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              AppLocalizations.of(context)!.sureShutDown,
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
                    label: AppLocalizations.of(context)!.stay,
                    fillColor: ColorManager.primaryGreen,
                    onTap: () {
                      AppRouter.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    label: AppLocalizations.of(context)!.close,
                    fillColor: Colors.grey,
                    isFilled: true,
                    labelColor: Colors.white,
                    onTap: () {
                      SystemNavigator.pop();
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
