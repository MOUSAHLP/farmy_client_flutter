
import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/background_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/translations.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundAuth(child:Column(
      children: [
        const SizedBox(height: 34,),
        Text("أهلاً بك :)",style: getBoldStyle(color: Colors.white,fontSize: 29)),

        const SizedBox(height: 67,),
        ButtonAuth(label: AppLocalizations.of(context)!.new_subscription),
        const SizedBox(height: 27,),
        ButtonAuth(label: AppLocalizations.of(context)!.sign_in),
        const SizedBox(height: 27,),
        ButtonAuth(label: AppLocalizations.of(context)!.login_guest),
        const SizedBox(height: 27,),

      ],
    ) ,);
  }
}
