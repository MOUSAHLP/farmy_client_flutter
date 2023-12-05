import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/main_screen/main_screen.dart';
import 'package:pharma/translations.dart';

import '../../../core/app_router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:2), () {
      AppRouter.push(context,  const MainScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
           width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              SvgPicture.asset(IconsManager.logoGreen),
              Text("فارمي",style: getRegularStyle(color: ColorManager.primaryGreen,fontSize: 30),),
              Text(AppLocalizations.of(context)!.welcome,style: getBoldStyle(color: ColorManager.primaryGreen,fontSize: 30),),
              Image.asset(ImageManager.emoji),
              Expanded(child: Image.asset(ImageManager.welcome,fit: BoxFit.fill,width: 1.sw,))
            ],
          ),
        ),
      ),
    );
  }
}
