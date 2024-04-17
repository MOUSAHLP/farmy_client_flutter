import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_event.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/app_validators.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/core/utils/firebase_notifications_handler.dart';
import 'package:pharma/models/params/login_params.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/location_first_screen/location_first_screen.dart';
import 'package:pharma/presentation/widgets/password_input_field_auth.dart';
import 'package:pharma/translations.dart';
import ' widgets/button_auth.dart';
import ' widgets/input_field_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.login) {
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
      onWillPop: () async {
        return true;
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 93,
            ),
            Text(
              AppLocalizations.of(context)!.sign_in,
              style: getBoldStyle(
                color: Colors.white,
                fontSize: 29.0.sp,
              ),
            ),
            SizedBox(height: 58.0.h),
            InputFieldAuth(
              icon: Image.asset(
                ImageManager.flagOfSyria,
                height: 20.0.h,
              ),
              keyboardType: TextInputType.phone,
              isPhone: true,
              controller: phoneController,
              hintText: AppLocalizations.of(context)!.hint_phone,
              validator: (value) {
                return AppValidators.validatePhoneFields(
                  context,
                  phoneController.text,
                );
              },
            ),
            SizedBox(height: 24.h),
            PasswordInputFieldAuth(
              controller: passwordController,
              hintText: AppLocalizations.of(context)!.password,contentPadding: EdgeInsets.only(right: 13.w),
              // validator: (value) {
              //   return AppValidators.validatePasswordFields(
              //       context, passwordController.text);
              // },
            ),
            SizedBox(height: 31.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.forget_password,
                  style: getSemiBoldStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5.w),
                InkWell(
                  onTap: () {
                    context.read<AuthenticationBloc>().add(
                          TapOnPressed(
                            ScreensAuth.phoneNumberScreen,
                          ),
                        );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.reset_password,
                    style: TextStyle(
                      fontSize: FontSizeApp.s14.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.yellow,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorManager.yellow,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            ButtonAuth(
                label: AppLocalizations.of(context)!.sign_in,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    String? token = await FirebaseNotificationsHandler().refreshFcmToken();
                    sl<AuthenticationBloc>().add(
                      Login(
                        loginParams: LoginParams(
                          phone: phoneController.text,
                          password: passwordController.text,
                          deviceToken: token,
                        ),
                      ),
                    );
                  }
                  // AppRouter.push(context, const MainScreen(),);
                }),
            SizedBox(height: 13.h),
            ButtonAuth(
                label: AppLocalizations.of(context)!.back,
                onTap: () {
                  AppRouter.pop(context);
                }),
            SizedBox(height: 13.h),
          ],
        ),
      ),
    );
  }
}
