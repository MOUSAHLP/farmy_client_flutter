import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

import 'package:pharma/presentation/screens/change_password/widgets/custom_label_with_pass_field.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.change_Password),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  child: Column(
                    children: [
                      CustomLabelWithPassField(
                        labelName:
                            AppLocalizations.of(context)!.previous_Password,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 42),
                        child: CustomLabelWithPassField(
                          labelName: AppLocalizations.of(context)!.new_password,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: CustomLabelWithPassField(
                          labelName:
                              AppLocalizations.of(context)!.confirm_password,
                        ),
                      ),
                      const SizedBox(
                        height: 97,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                        ),
                        child: Column(
                          children: [
                            CustomButton(
                              label: AppLocalizations.of(context)!.save_Changes,
                              fillColor: ColorManager.primaryGreen,
                              isFilled: true,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomButton(
                              label: AppLocalizations.of(context)!
                                  .forgot_Password_Without_question_mark,
                              onTap: () {},
                              fillColor: Colors.white,
                              borderColor: ColorManager.primaryGreen,
                              labelColor: ColorManager.primaryGreen,
                              isFilled: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
