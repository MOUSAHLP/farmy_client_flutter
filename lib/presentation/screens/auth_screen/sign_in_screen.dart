
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import ' widgets/button_auth.dart';
import ' widgets/input_field_auth.dart';
import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authentication_state.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/app_enum.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../../models/params/login_params.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/style_app.dart';
import '../../widgets/password_input_field_auth.dart';
import '../location_first_screen/location_first_screen.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.authenticationScreen ==
              AuthenticationScreenStates.authenticationAuthenticated) {

            AppRouter.push(context, const LocationFirstScreen());
          }

        },

        child: SignInBody());
  }
}
class SignInBody extends StatelessWidget {
   SignInBody({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          return true;
        },
        child: Form(
           key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 93,
              ),
              Text(AppLocalizations.of(context)!.sign_in,
                  style:
                  getBoldStyle(color: Colors.white, fontSize: 29)),
              const SizedBox(
                height: 58,
              ),
              InputFieldAuth(
                  suffixIcon: Image.asset(
                    ImageManager.flagOfSyria,
                    height: 20,
                    width: 20,
                  ),
                keyboardType: TextInputType.phone,
                controller: phoneController,
                  hintText: AppLocalizations.of(context)!.hint_phone,
                validator: (value) {
                  return AppValidators.validatePhoneFields(
                      context, phoneController.text);
                },
                ),
              const SizedBox(
                height: 24,
              ),
              PasswordInputFieldAuth(
                controller: passwordController,
                hintText: AppLocalizations.of(context)!.password,
                validator: (value) {
                  return AppValidators.validatePasswordFields(
                      context, passwordController.text);
                },
              ),
              const SizedBox(
                height: 31,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.forget_password,
                      style: getSemiBoldStyle(color: Colors.white)),
                  InkWell(
                    onTap: () {
                      context.read<AuthenticationBloc>().add(
                          TapOnPressed(ScreensAuth.phoneNumberScreen)
                      );
                    },
                    child: Text(
                        AppLocalizations.of(context)!.reset_password,
                        style: getSemiBoldStyle(color: Colors.yellow)),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              ButtonAuth(
                  label: AppLocalizations.of(context)!.sign_in,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      sl<AuthenticationBloc>().add(
                        Login(
                          loginParams: LoginParams(
                            phone: phoneController.text,
                            password: passwordController.text,
                          ),
                        ),
                      );
                    }
                   // AppRouter.push(context, const MainScreen(),);
                  }),
              const SizedBox(
                height: 13,
              ),
              ButtonAuth(
                  label: AppLocalizations.of(context)!.back,
                  onTap: () {
                    AppRouter.pop(context);
                  }),
              const SizedBox(
                height: 13,
              )
            ],
          ),
        ),
      );
  }
}
