import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/translations.dart';
import '../../../core/app_router/app_router.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageManager.logoGuest),
        const SizedBox(height: 44),
        SizedBox(
          width: 1.sw - 100,
          child: Text(AppLocalizations.of(context)!.sign_now_or_create,
              style: getBoldStyle(color: ColorManager.grayForMessage),
              textAlign: TextAlign.center),
        ),
        const SizedBox(height: 37),
        CustomButton(
            width: 1.sw - 100,
            label: AppLocalizations.of(context)!.sign_Up_Now,
            onTap: () {
              AppRouter.push(context, const AccountScreen());
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
