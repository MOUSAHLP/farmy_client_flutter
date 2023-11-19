import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/background_auth.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/translations.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return Colors.white;
  }
  @override
  Widget build(BuildContext context) {
    return BackGroundAuth(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(AppLocalizations.of(context)!.new_account,
                style: getBoldStyle(color: Colors.white, fontSize: 25)),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: InputFieldAuth(
                    hintText: AppLocalizations.of(context)!.fName,
                  //   width: 1.sw-260,
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: InputFieldAuth(
                    hintText: AppLocalizations.of(context)!.lName,
                   // width: 1.sw-260,
                    // width: 140,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 21,
            ),InputFieldAuth(
                hintText: AppLocalizations.of(context)!.phone,
                suffixIcon: const CountryCodePicker(
                  showCountryOnly: true,
                  flagWidth: 20,
                  enabled: false,
                  initialSelection: 'SY',
                )),
            const SizedBox(
              height: 21,
            ),
            InputFieldAuth(
              hintText: AppLocalizations.of(context)!.password,
            ),
            const SizedBox(
              height: 21,
            ),
            InputFieldAuth(
              hintText: AppLocalizations.of(context)!.confirm_password,
            ),
            const SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(

                  checkColor: ColorManager.primaryGreen,
                   fillColor:MaterialStateProperty.resolveWith(getColor),

                  // value: isChecked,
                  onChanged: (bool? value) {
                    // setState(() {
                    //   isChecked = value!;
                    // });
                  }, value: true,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 1.sw-130,
                    height: 50,
                    child: Text(AppLocalizations.of(context)!.police,
                        style: getSemiBoldStyle(color: Colors.white),
                        maxLines: 2,overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height:31,
            ),
            ButtonAuth(
                label: AppLocalizations.of(context)!.register, onTap: () {
                  AppRouter.push(context, const HomeScreen());
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
