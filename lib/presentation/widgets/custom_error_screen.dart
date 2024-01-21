
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CustomErrorScreen extends StatelessWidget {
  final Function()? onTap;
final  String? titleError;
  const CustomErrorScreen({super.key, required this.onTap,this.titleError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(ImageManager.logoAboutApp,color: ColorManager.primaryGreen),
          const SizedBox(height: 100),
          Text(titleError??"",style: getBoldStyle(color: ColorManager.primaryGreen)),
          const SizedBox(height: 100),
          CustomButton(label: AppLocalizations.of(context)!.try_again,onTap: (){
            onTap!();
          },)
        ],
      ),
    );
  }
}
