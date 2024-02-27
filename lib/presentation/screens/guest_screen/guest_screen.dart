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
        Image.asset(ImageManager.logoGuest, height:1.sh*0.24,
            width:1.sw*0.44 ),
        SizedBox(
          height:1.sh*0.02,
        ),
        SizedBox(
          width: 1.sw * 0.7,
          child: Text(AppLocalizations.of(context)!.sign_now_or_create,
              style: getBoldStyle(color: ColorManager.grayForMessage),
              textAlign: TextAlign.center),
        ),
        SizedBox(
          height:1.sh*0.05,
        ),
        CustomButton(
            width: 1.sw * 0.7,
            label: AppLocalizations.of(context)!.sign_Up_Now,
            onTap: () {
              AppRouter.push(context, const AccountScreen());
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
