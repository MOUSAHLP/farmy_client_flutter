import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/confirm_delete_account_dialog.dart';
import 'package:pharma/translations.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          child: Column(
            children: [
              CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.delete_account,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 19,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                            AppLocalizations.of(context)!
                                .sorry_for_delete_account,
                            style: getUnderBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 24),
                        child: InputFieldAuth(
                          maxLines: 5,
                          minLines: 5,
                          height: .30.sw,
                          width: 1.sw,
                          color: ColorManager.lightGray,
                          hintText: AppLocalizations.of(context)!
                              .write_in_this_box_optional,
                          hintStyle: getUnderBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                            AppLocalizations.of(context)!
                                .please_write_your_phone_and_password,
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 19),
                        child: InputFieldAuth(
                            textAlign: TextAlign.end,
                            angelRadios: const Radius.circular(6),
                            color: const Color.fromRGBO(228, 228, 228, 1),
                            textStyle: getUnderBoldStyle(
                                color: ColorManager.grayForSearchProduct,
                                fontSize: FontSizeApp.s14)!,
                            width: 1.sw,
                            hintText: " 000000000 963+",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: ColorManager.grayForSearchProduct,
                                fontSize: FontSizeApp.s14),
                            suffixIcon: Image.asset(
                              ImageManager.flagOfSyria,
                              height: 20,
                              width: 20,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InputFieldAuth(
                          textAlign: TextAlign.end,
                          angelRadios: const Radius.circular(6),
                          color: const Color.fromRGBO(228, 228, 228, 1),
                          textStyle: getUnderBoldStyle(
                              color: ColorManager.grayForSearchProduct,
                              fontSize: FontSizeApp.s14)!,
                          width: 1.sw,
                          hintText:
                              AppLocalizations.of(context)!.password_with_star,
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorManager.grayForSearchProduct,
                              fontSize: FontSizeApp.s14),
                          suffixIcon: const Text(" "),
                        ),
                      ),
                      const SizedBox(
                        height: 99,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 72),
                        child: CustomButton(
                          onTap: () {
                            ConfirmDeleteAccountDialog.openDialog(
                                context,
                                AppLocalizations.of(context)!
                                    .your_Account_Has_Been_Successfully_Deleted);
                          },
                          label: AppLocalizations.of(context)!.confirm_delete,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
