import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations.dart';
import '../../widgets/password_input_field_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final _formState = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.changePasswordSuccess) {
          AppRouter.pushReplacement(context, const AccountScreen());
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          sl<AuthenticationBloc>()
              .add(TapOnPressed(ScreensAuth.phoneNumberScreen));
          return false;
        },
        child: FadeTransition(
          opacity: animation,
          child: Form(
            key: _formState,
            child: Column(
              children: [
                const SizedBox(
                  height: 93,
                ),
                Text(AppLocalizations.of(context)!.select_new_password,
                    style: getBoldStyle(color: Colors.white, fontSize: 29)),
                const SizedBox(
                  height: 58,
                ),
                PasswordInputFieldAuth(
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.new_password,
                    validator: (value) {
                      return AppValidators.validatePasswordFields(
                          context, value);
                    }),
                const SizedBox(
                  height: 13,
                ),
                PasswordInputFieldAuth(
                    controller: repeatPasswordController,
                    hintText: AppLocalizations.of(context)!.confirm_password,
                    validator: (value) {
                      return AppValidators.validateRepeatPasswordFields(
                          context, passwordController.text, value);
                    }),
                const SizedBox(
                  height: 132,
                ),
                ButtonAuth(
                    label: AppLocalizations.of(context)!.confirm,
                    onTap: () {
                      if (_formState.currentState!.validate()) {
                        sl<AuthenticationBloc>().add(ForgetPassword(
                            password: passwordController.text,
                            repeatPassword: repeatPasswordController.text));
                      }
                    }),
                const SizedBox(height: 13),
                ButtonAuth(
                    label: AppLocalizations.of(context)!.back,
                    onTap: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(TapOnPressed(ScreensAuth.phoneNumberScreen));
                    }),
                const SizedBox(
                  height: 13,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
