
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/translations.dart';


import '../../../core/app_router/dialog_transition_builder.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../custom_button.dart';
import 'custom_dialog.dart';

class ErrorDialog {
  static void openDialog(BuildContext context, String? message) {
    dialogTransitionBuilder(
        context,
        _ErrorDialogBody(
          message: message,
        ));
  }
}

class _ErrorDialogBody extends StatelessWidget {
  const _ErrorDialogBody({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          SvgPicture.asset(IconsManager.errorIcon),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10,
            ),
            child: Text(
              (message == null || message!.isEmpty)
                  ? AppLocalizations.of(context)!.error
                  : message!,
              style: getBoldStyle(
                color: ColorManager.redForFavorite,
                fontSize: FontSizeApp.s14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              label: AppLocalizations.of(context)!.try_again,
              fillColor: ColorManager.redForFavorite,
              onTap: () {
                AppRouter.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
