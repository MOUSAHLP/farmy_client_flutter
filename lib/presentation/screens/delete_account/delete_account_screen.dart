import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/confirm_delete_account_dialog.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authentication_state.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/app_validators.dart';
import '../../../models/params/delete_account_params.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBarScreen(
                  sectionName: AppLocalizations.of(context)!.delete_account,
                ),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state.isLoading) {
                      LoadingDialog().openDialog(context);
                    } else {
                      LoadingDialog().closeDialog(context);
                    }
                    if (state.error != null) {
                      ErrorDialog.openDialog(context, state.error);
                    }
                    if(state.isDeleteAccount){
                      AppRouter.pushReplacement(context, AccountScreen());
                    }
                  },
                  builder: (context, state) => Expanded(
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
                                controller: reasonController,
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
                                validator: (value) {
                                  return AppValidators.validateNameFields(
                                      context, reasonController.text);
                                }),
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
                              keyboardType: TextInputType.phone,
                                controller: phoneController,
                                angelRadios: const Radius.circular(6),
                                color: const Color.fromRGBO(228, 228, 228, 1),
                                textStyle: getUnderBoldStyle(
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14)!,
                                width: 1.sw,
                                hintText:
                                    AppLocalizations.of(context)!.hint_phone,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14),
                                isPhone: true,
                                icon: Image.asset(
                                  ImageManager.flagOfSyria,
                                  height: 20,
                                  width: 20,
                                ),
                                validator: (value) {
                                  return AppValidators.validatePhoneFields(
                                      context, phoneController.text);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: InputFieldAuth(
                                controller: passwordController,
                                angelRadios: const Radius.circular(6),
                                color: const Color.fromRGBO(228, 228, 228, 1),
                                textStyle: getUnderBoldStyle(
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14)!,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!
                                    .password_with_star,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14),
                                suffixIcon: const Text(" "),
                                validator: (value) {
                                  return AppValidators.validatePasswordFields(
                                      context, passwordController.text);
                                }),
                          ),
                          const SizedBox(
                            height: 99,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 72),
                            child: CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        DeleteAccount(
                                          deleteAccountParams:
                                              DeleteAccountParams(
                                                  phone: phoneController.text,
                                                  password:
                                                      passwordController.text,
                                                  deleteReason:
                                                      reasonController.text),
                                        ),
                                      );
                                }
                                // ConfirmDeleteAccountDialog.openDialog(
                                //     context,
                                //     AppLocalizations.of(context)!
                                //         .your_Account_Has_Been_Successfully_Deleted);
                              },
                              label:
                                  AppLocalizations.of(context)!.confirm_delete,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
