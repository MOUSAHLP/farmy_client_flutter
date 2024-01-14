import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/translations.dart';

import '../../../core/app_router/app_router.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_app.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(LottieManager.iconLogIn,),
        Text(AppLocalizations.of(context)!.sign_now_or_create,
            style: getBoldStyle(color: ColorManager.redForFavorite),
        textAlign: TextAlign.center),
        const SizedBox(height: 10,),
        MaterialButton(
          minWidth: 200,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0))),
          color: ColorManager.primaryGreen,
          onPressed: (){
            AppRouter.push(context, const AccountScreen());

          },child: Text(AppLocalizations.of(context)!.sign_in , style: getBoldStyle(color: Colors.white),),)
      ],
    );
  }
}
