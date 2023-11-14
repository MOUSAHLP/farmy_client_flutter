import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/background_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/phone_number_screen.dart';
import 'package:pharma/translations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  bool _visible = true;
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
    return BackGroundAuth(
        child: index == 0
            ? Column(
              children: [
                const SizedBox(
                  height: 93,
                ),
                Text(AppLocalizations.of(context)!.sign_in,
                    style: getBoldStyle(color: Colors.white, fontSize: 29)),
                const SizedBox(
                  height: 58,
                ),
                InputFieldAuth(
                  hintText: AppLocalizations.of(context)!.phone,
                  suffixIcon: CountryCodePicker(
                      showCountryOnly: false,
                      flagWidth: 20,
                      boxDecoration: BoxDecoration(),
                     enabled: false,
                      initialSelection: 'SY',
                  )
                ),
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
                      onTap: (){
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Text(AppLocalizations.of(context)!.reset_password,
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

                      //   AppRouter.push(context, AccountScreen());
                    }),
                const SizedBox(
                  height: 13,
                ),
                ButtonAuth(
                    label: AppLocalizations.of(context)!.back,
                    onTap: () {
                      AppRouter.pop(context);

                      //   AppRouter.push(context, AccountScreen());
                    }),
                const SizedBox(
                  height: 13,
                )
              ],
            )
            : index == 1
                ? PhoneNumberScreen()
                : AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    child: Text("nooooo")));
  }
}
