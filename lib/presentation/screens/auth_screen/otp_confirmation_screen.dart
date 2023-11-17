
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_event.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/translations.dart';

class OtpConfirmationScreen extends StatefulWidget {
  const OtpConfirmationScreen({super.key});

  @override
  State<OtpConfirmationScreen> createState() => _OtpConfirmationScreenState();
}

class _OtpConfirmationScreenState extends State<OtpConfirmationScreen>
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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state)
      {
        return WillPopScope(
          onWillPop: ()async{
            context.read<AuthenticationBloc>().add(
                TapOnPressed(1)
            );
            return false;
          },
          child: FadeTransition(
            opacity: animation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(
                    height: 93,
                  ),
                  Text(AppLocalizations.of(context).account_Confirmation,
                      style:
                      getBoldStyle(color: Colors.white, fontSize: 29)),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(AppLocalizations.of(context).verification_code,
                      style:
                      getBoldStyle(color: Colors.white, fontSize:14)),

                  const SizedBox(
                    height: 58,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: PinFieldAutoFill(
                      decoration: BoxLooseDecoration(
                        strokeColorBuilder:  const FixedColorBuilder(ColorManager.primaryGreen),
                   bgColorBuilder:const FixedColorBuilder(Colors.white),


                        textStyle:
                        const TextStyle(fontSize: 20, color: ColorManager.primaryGreen),
                        // colorBuilder:
                        // const FixedColorBuilder(ColorManager.primaryGreen),
                      ),
                 //   currentCode: textEditingController.text,
                      codeLength: 6,
                      onCodeChanged: (String? code) {

                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).receive_code,
                          style: getSemiBoldStyle(color: Colors.white)),
                      InkWell(
                        onTap: () {
                          context.read<AuthenticationBloc>().add(
                              TapOnPressed(3)
                          );
                        },
                        child: Text(
                            AppLocalizations.of(context).resend_code,
                            style: getSemiBoldStyle(color: Colors.yellow)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  ButtonAuth(
                      label: AppLocalizations.of(context).done,
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(TapOnPressed(3));
                      }),
                  const SizedBox(
                    height: 13,
                  ),
                  ButtonAuth(
                      label: AppLocalizations.of(context).back,
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(TapOnPressed(1));
                      }),
                  const SizedBox(
                    height: 13,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
