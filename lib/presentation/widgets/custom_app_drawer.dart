import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pharma/presentation/screens/all_invoices/all_invoices_screen.dart';
import 'package:pharma/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:pharma/presentation/screens/join_our_team/join_our_team_screen.dart';
import 'package:pharma/presentation/screens/setting_screen/setting_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';
import '../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../core/app_router/app_router.dart';
import '../../core/services/services_locator.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_app.dart';
import '../screens/auth_screen/account_screen.dart';
import 'dialogs/logout_confirmation_dialog.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          width: 263,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: CustomOverscrollIndicator(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 73,
                          ),
                          Container(
                            height: 142,
                            width: 142,
                            decoration: const BoxDecoration(
                              color: ColorManager.lightGray,
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Center(
                                    child: SvgPicture.asset(
                                  IconsManager.logoApp,
                                  width: 50,
                                  height: 50,
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xff99B990), BlendMode.srcIn),
                                ))),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          sl<AuthenticationBloc>().loggedIn?   Text(
                            "${
                                context
                                    .read<AuthenticationBloc>()
                                    .loginResponse!
                                    .firstName
                            } ${context
                                .read<AuthenticationBloc>()
                                .loginResponse!
                                .lastName}",
                            style: getMediumStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ):const SizedBox(),
                          const SizedBox(
                            height: 21,
                          ),
                          const Divider(
                            color: Colors.grey,
                            indent: 15,
                            endIndent: 15,
                          ),
                          buildElevatedButton(
                              AppLocalizations.of(context)!.settings, () {
                            AppRouter.push(context, const SettingScreen());
                          }),
                          buildElevatedButton(
                              AppLocalizations.of(context)!.all_invoices, () {
                            AppRouter.push(context, const AllInvoicesScreen());
                          }),
                          buildElevatedButton(
                              AppLocalizations.of(context)!.connect_with_us,
                              () {
                            AppRouter.push(context, const ContactUsScreen());
                          }),
                          buildElevatedButton(
                              AppLocalizations.of(context)!.join_our_team, () {
                            AppRouter.push(context, const JoinOurTeamScreen());
                          }),
                          buildElevatedButton(
                              AppLocalizations.of(context)!.who_are_we, () {
                            AppRouter.pop(context);
                          }),
                          sl<AuthenticationBloc>().loggedIn?  buildElevatedButton(
                              AppLocalizations.of(context)!.sign_out, () {
                            LogoutConfirmationDialog.handle(context);
                          }):buildElevatedButton(
                              AppLocalizations.of(context)!.sign_in, () {
                            AppRouter.push(context, const AccountScreen());
                          }),
                          const SizedBox(height: 20),

                          // const SizedBox(width:20),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<PackageInfo> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Farmy V.${snapshot.data!.version}',
                              style: const TextStyle(
                                height: 0.8,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primaryGreen,
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton(String title, Function fun) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            fun();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Text(
                  title,
                  style: getBoldStyle(fontSize: 13, color: Colors.black),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    color: ColorManager.grayForMessage, size: 20),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          indent: 15,
          endIndent: 15,
        )
      ],
    );
  }
}
