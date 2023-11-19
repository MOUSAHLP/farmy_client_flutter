import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_event.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';

import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/background_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/phone_number_screen.dart';
import 'package:pharma/presentation/screens/auth_screen/reset_password.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/translations.dart';

import 'otp_confirmation_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: sl<AuthenticationBloc>()..add(TapOnPressed(0)),
      listener: (context, state) {

      },
     builder: (context, state)
     {
       return BackGroundAuth(
            child: state.indexTap == 0
                ? WillPopScope(
              onWillPop: ()async{

                return true;
              },
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
                            hintText: AppLocalizations.of(context)!.phone,
                            suffixIcon: const CountryCodePicker(
                              showCountryOnly: false,
                              flagWidth: 20,
                              boxDecoration: BoxDecoration(),
                              enabled: false,
                              initialSelection: 'SY',
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        InputFieldAuth(
                          hintText: AppLocalizations.of(context)!.password,
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
                                    TapOnPressed(1)
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
                              AppRouter.push(context, const HomeScreen(),);
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
                )
                : state.indexTap == 1
                    ? const PhoneNumberScreen()
                    :state.indexTap == 2?const OtpConfirmationScreen(): const ResetPasswordScreen());
      },
    );
  }
}
