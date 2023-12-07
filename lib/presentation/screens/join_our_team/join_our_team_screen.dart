import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class JoinOurTeamScreen extends StatelessWidget {
  const JoinOurTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CustomAppBarScreen(
                  sectionName: AppLocalizations.of(context)!.join_our_team),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 21),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.join_Our_Team_Statment,
                          style: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: ColorManager.black.withOpacity(0.18))
                          ]),
                          child: InputFieldAuth(
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.password,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: ColorManager.black.withOpacity(0.18))
                          ]),
                          child: InputFieldAuth(
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.password,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: ColorManager.black.withOpacity(0.18))
                          ]),
                          child: InputFieldAuth(
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.password,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorManager.primaryGreen,
                                    borderRadius: BorderRadius.circular(4)),
                                height: 22,
                                width: 22,
                                child:
                                    Image.asset(ImageManager.listOfTypeJoinUs),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
