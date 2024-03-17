import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/about_the_app/about_the_app_screen.dart';
import 'package:pharma/presentation/screens/change_password/change_password_screen.dart';
import 'package:pharma/presentation/screens/setting_screen/widgets/card_setting.dart';
import 'package:pharma/presentation/screens/setting_screen/widgets/conditions_screen.dart';
import 'package:pharma/presentation/screens/setting_screen/widgets/faq_screen.dart';
import 'package:pharma/presentation/screens/setting_screen/widgets/privacy_policy_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/language_bloc/language_bloc.dart';
import '../../../bloc/language_bloc/language_event.dart';
import '../../../bloc/language_bloc/language_state.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/data_resource/local_resource/data_store.dart';
import '../../widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.settings,
              isComeBack: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.protection,
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CardSetting(
                            title: AppLocalizations.of(context)!.change_Password,
                            onTap: () {
                              AppRouter.push(
                                  context, const ChangePasswordScreen());
                            }),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.change_Language,
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, state) => CardSetting(
                              title: DataStore.instance.lang == "ar"
                                  ? "العربية"
                                  : "English",
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                              child: Container(
                                                height: 43,
                                                decoration: BoxDecoration(
                                                    color: ColorManager.lightGray,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text("English",
                                                          style: getBoldStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                          )),
                                                    ),
                                                    Radio(
                                                      fillColor: MaterialStateColor
                                                          .resolveWith((states) =>
                                                              ColorManager
                                                                  .primaryGreen),
                                                      value: "en",
                                                      groupValue: context
                                                          .read<LanguageBloc>()
                                                          .lang,
                                                      onChanged: (value) {
                                                        sl<LanguageBloc>().add(
                                                            SelectLanguage(
                                                                value ?? "en"));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {}),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          GestureDetector(
                                              child: Container(
                                                height: 43,
                                                decoration: BoxDecoration(
                                                    color: ColorManager.lightGray,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text("عربي",
                                                          style: getBoldStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                          )),
                                                    ),
                                                    Radio(
                                                      fillColor: MaterialStateColor
                                                          .resolveWith((states) =>
                                                              ColorManager
                                                                  .primaryGreen),
                                                      value: "ar",
                                                      groupValue: context
                                                          .read<LanguageBloc>()
                                                          .lang,
                                                      onChanged: (value) {
                                                        sl<LanguageBloc>().add(
                                                            SelectLanguage(
                                                                value ?? "ar"));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {}),
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          SizedBox(
                                            width: 97,
                                            child: CustomButton(
                                              label: AppLocalizations.of(context)!
                                                  .confirm,
                                              fillColor:
                                                  ColorManager.primaryGreen,
                                              onTap: () {
                                                sl<LanguageBloc>().add(
                                                    NewLanguageChange(context
                                                        .read<LanguageBloc>()
                                                        .lang));
                                                AppRouter.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .privacy_and_Terms_of_Use,
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CardSetting(
                            title: AppLocalizations.of(context)!
                                .terms_and_Conditions,
                            onTap: () {
                              AppRouter.push(context, const ConditionsScreen());
                            }),
                      ),
                      CardSetting(
                          title: AppLocalizations.of(context)!.privacy_Policy,
                          onTap: () {
                            AppRouter.push(context, const PrivacyPolicyScreen());
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CardSetting(
                            title: AppLocalizations.of(context)!
                                .frequently_Asked_Questions,
                            onTap: () {
                              AppRouter.push(context, const FAQScreen());
                            }),
                      ),
                      CardSetting(
                          title: AppLocalizations.of(context)!.about_Application,
                          onTap: () {
                            AppRouter.push(context, const AboutTheAppcreen());
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
