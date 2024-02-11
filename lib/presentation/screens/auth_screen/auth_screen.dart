import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_event.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/background_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/phone_number_screen.dart';
import 'package:pharma/presentation/screens/auth_screen/reset_password.dart';
import 'package:pharma/presentation/screens/auth_screen/sign_in_screen.dart';
import '../../../core/app_enum.dart';
import 'otp_confirmation_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: sl<AuthenticationBloc>()
        ..add(TapOnPressed(ScreensAuth.signInScreen)),
      builder: (context, state) {
        return BackGroundAuth(
            child: state.indexTap == ScreensAuth.signInScreen
                ? const SignInScreen()
                : state.indexTap == ScreensAuth.phoneNumberScreen
                    ? const PhoneNumberScreen()
                    : state.indexTap == ScreensAuth.otpConfirmationScreen
                        ? const OtpConfirmationScreen()
                        : const ResetPasswordScreen());
      },
    );
  }
}
