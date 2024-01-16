
import 'dart:async';

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
import '../../../core/app_enum.dart';
import '../../../core/services/services_locator.dart';

class OtpConfirmationScreen extends StatelessWidget {
  const OtpConfirmationScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.confirmOtp) {

            context
                .read<AuthenticationBloc>()
                .add(TapOnPressed(ScreensAuth.resetPasswordScreen));
          }
          },
        child: const OtpConfirmationBody());
  }
}
class OtpConfirmationBody extends StatefulWidget {
  const OtpConfirmationBody({super.key});

  @override
  State<OtpConfirmationBody> createState() => _OtpConfirmationBodyState();
}

class _OtpConfirmationBodyState extends State<OtpConfirmationBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final TextEditingController textEditingController = TextEditingController();
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;
  bool showTimer =  true;
  void _startTimer() async {
    showTimer=false;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minutes < 59) {
            _minutes++;
          } else {
            _minutes = 0;
            _hours++;
          }

          if (_minutes == 1) {
            _stopTimer();
          }
        }
      });
    });
  }
  void _stopTimer() {
    _timer?.cancel();
    _hours = 0;
     _minutes = 0;
     _seconds = 0;
     showTimer=true;
  }
  @override
  initState() {

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
         WillPopScope(
          onWillPop: ()async{
           sl<AuthenticationBloc>().add(
                TapOnPressed(ScreensAuth.signInScreen)
            );
            return false;
          },
          child: FadeTransition(
            opacity: animation,
            child:  BlocBuilder<AuthenticationBloc,AuthenticationState>(
              builder: (context, state) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 93,
                    ),
                    Text(AppLocalizations.of(context)!.account_Confirmation,
                        style:
                        getBoldStyle(color: Colors.white, fontSize: 29)),

                    const SizedBox(
                      height: 21,
                    ),
                    Text(AppLocalizations.of(context)!.verification_code,
                        style:
                        getBoldStyle(color: Colors.white, fontSize:14)),
                    Text(context
                        .read<AuthenticationBloc>()
                        .otpVerifyResponse
                        !.code.toString(),
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
                        ),
                        currentCode: textEditingController.text,
                        codeLength: 6,
                        onCodeChanged: (String? code) {
                          if (code != null) {
                            textEditingController.text = code;
                            if (code.length == 6) {
                              _stopTimer();
                               sl<AuthenticationBloc>().add(
                                  ConfirmOtp(code: textEditingController.text,phone: "888888"));

                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                   Column(
                       children: [
                         Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.receive_code,
                                  style: getSemiBoldStyle(color: Colors.white)),
                              showTimer?  InkWell(
                                onTap: () {
                                  _startTimer();
                                  context.read<AuthenticationBloc>().add(
                                      ReSendCode(
                                        phone: context.read<AuthenticationBloc>().otpVerifyResponse!.phone??""
                                      ));
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.resend_code,
                                    style: getSemiBoldStyle(color: Colors.yellow)),
                              ):const SizedBox(),
                            ],
                          ),
                         !showTimer? Text(AppLocalizations.of(context)!.resend_minute, style: getSemiBoldStyle(color: Colors.white)):const SizedBox(),
                         !showTimer? Text('$_hours:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}', style: getSemiBoldStyle(color: Colors.white)):const SizedBox(),
                       ],
                     ),

                    const SizedBox(
                      height: 54,
                    ),
                    ButtonAuth(
                        label: AppLocalizations.of(context)!.done,
                        onTap: () {
                          if (textEditingController.text.length == 6) {
                         sl<AuthenticationBloc>().add(
                                ConfirmOtp(code: textEditingController.text,phone: "888888"));

                          } else {
                            //toast(AppLocalizations.of(context)!.enterAllField);
                          }

                        }),
                    const SizedBox(
                      height: 13,
                    ),
                    ButtonAuth(
                        label: AppLocalizations.of(context)!.back,
                        onTap: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(TapOnPressed(ScreensAuth.signInScreen));
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
