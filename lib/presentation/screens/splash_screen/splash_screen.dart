
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      AppRouter.push(context,  const OnBoardingScreen());

    });

    return Container(width: 1.sw,
    height: 1.sh,
    color: ColorManager.primaryGreen,
child: Image.asset(LottieManager.logoSplash),
    );
  }
}
