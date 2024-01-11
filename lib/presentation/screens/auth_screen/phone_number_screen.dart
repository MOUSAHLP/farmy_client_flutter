
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';

import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/app_enum.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.sentOtp) {

            sl<AuthenticationBloc>().add(
                TapOnPressed(ScreensAuth.otpConfirmationScreen)
            );
          }
        },
        child:
        const PhoneNumberBody(

        ));
  }
}
class PhoneNumberBody extends StatefulWidget {
  const PhoneNumberBody({super.key});

  @override
  State<PhoneNumberBody> createState() => _PhoneNumberBodyState();
}

class _PhoneNumberBodyState extends State<PhoneNumberBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
    return WillPopScope(
        onWillPop: ()async{
          context.read<AuthenticationBloc>().add(
              TapOnPressed(ScreensAuth.signInScreen)
          );
          return false;
        },
        child: FadeTransition(
          opacity: animation,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 93,
                ),
                Text(AppLocalizations.of(context)!.reset_password,
                    style: getBoldStyle(color: Colors.white, fontSize: 29)),
                const SizedBox(
                  height: 58,
                ),
                InputFieldAuth(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                    hintText: AppLocalizations.of(context)!.phone,
                    suffixIcon: Image.asset(
                      ImageManager.flagOfSyria,
                      height: 20,
                      width: 20,
                    ),
                    validator: (value) {
                      return AppValidators.validatePhoneFields(
                          context, phoneController.text);
                    }
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 31,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 32),
                        child: Text(
                          AppLocalizations.of(context)!.reset_link,
                          style: getSemiBoldStyle(color: Colors.white, fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                ButtonAuth(label: AppLocalizations.of(context)!.done, onTap: () {
                  if (_formKey.currentState!.validate()) {
                      sl<AuthenticationBloc>().add(RequestOtp(
                          phoneNumber: phoneController.text));
                    }

                }),
                const SizedBox(
                  height: 13,
                ),
                ButtonAuth(
                    label: AppLocalizations.of(context)!.resend,
                    onTap: () {
                    }),
                const SizedBox(
                  height: 13,
                )
              ],
            ),
          ),
        ),
      );

  }
}
