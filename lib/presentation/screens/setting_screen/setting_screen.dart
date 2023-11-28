import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/setting_screen/widgets/card_setting.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("الحماية",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CardSetting(title: "تغيير كلمة المرور", onTap: (){}),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("تغيير اللغة",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CardSetting(title: "العربية", onTap: (){}),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("الخصوصية  و شروط الاستخدام",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CardSetting(title: "الشروط و الأحكام", onTap: (){}),
                    ),
                    CardSetting(title: "سياسة الخصوصية", onTap: (){}),
                    const SizedBox(height: 10,),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CardSetting(title: "الأسئلة الشائعة", onTap: (){}),
                    ),
                    CardSetting(title: "حول التطبيق", onTap: (){}),
                  ],
                ),
              ),
            ),
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
    );
  }
}
