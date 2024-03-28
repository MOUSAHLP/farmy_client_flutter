import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

import 'package:pharma/presentation/screens/change_password/widgets/custom_label_with_pass_field.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authentication_state.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../auth_screen/account_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {

          if (state.isLoading) {
            LoadingDialog().openDialog(context);
          } else {
            LoadingDialog().closeDialog(context);
          }
          if (state.error != null) {
            ErrorDialog.openDialog(context, state.error);
          }
          if (state.resetPassword) {

            AppRouter.pushReplacement(context, const AccountScreen());
          }
        },
        child: ChangePasswordBody());
  }
}
class ChangePasswordBody extends StatelessWidget {
  ChangePasswordBody({super.key});
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.change_Password),
            Expanded(
              child:  sl<AuthenticationBloc>().loggedIn?SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomLabelWithPassField(
                          labelName:
                              AppLocalizations.of(context)!.previous_Password,
                          controller: oldPasswordController,
                          validator: (value) {
                            return AppValidators.validateNameFields(
                                context, value);
                          },

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 42),
                          child: CustomLabelWithPassField(
                            labelName: AppLocalizations.of(context)!.new_password,
                            controller: passwordController,
                            validator: (value) {
                              // return AppValidators.validatePasswordFields(
                              //     context, value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: CustomLabelWithPassField(
                            labelName:
                                AppLocalizations.of(context)!.confirm_password,
                            controller: repeatPasswordController,
                            validator: (value){
                              // return AppValidators.validateRepeatPasswordFields(
                              //     context, passwordController.text, value);
                            },
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
                                onTap: (){
                                  if (_formKey.currentState!.validate()) {
                                          sl<AuthenticationBloc>().add(
                                              ResetPassword(
                                                  password:
                                                      passwordController.text,
                                                  repeatPassword:
                                                      repeatPasswordController
                                                          .text,
                                                  oldPassword:
                                                      oldPasswordController
                                                          .text));
                                        }
                                      },
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
              ):const GuestScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
