
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../translations.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) => FadeTransition(
        opacity: animation,
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
            InputFieldAuth(
              hintText: AppLocalizations.of(context)!.new_password,
            ),
            const SizedBox(
              height: 13,
            ),
            InputFieldAuth(
              hintText: AppLocalizations.of(context)!.confirm_password,
            ),
            const SizedBox(
              height: 132,
            ),
            ButtonAuth(
                label: AppLocalizations.of(context)!.confirm,
                onTap: () {
                AppRouter.pushReplacement(context, const AccountScreen());
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
