import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/basket_screen/basket_screen.dart';
import 'package:pharma/presentation/screens/favorite/favorite_screen.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/order_screen/order_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/will_pop_scope_handler.dart';
import 'package:pharma/translations.dart';

import '../my_account_screen/my_account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      HomeScreen(scaffoldKey: scaffoldKey),
      FavoriteScreen(),
      const BasketScreen(),
      const OrderScreen(),
      const MyAccountScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (scaffoldKey.currentState?.isDrawerOpen == true) {
          scaffoldKey.currentState?.closeDrawer();
        } else {
          if (context.read<HomeBloc>().currentIndex == 0) {
            WillPopScopeHandler.handle(context);
          } else {
            setState(() {

            });
            context.read<HomeBloc>().currentIndex = 0;

          }
        }
        return false;
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: children[context.read<HomeBloc>().currentIndex],
              ),
              Container(
                height: 70,
                width: 1.sw,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<HomeBloc>().currentIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 25,
                            width: 25,
                            ImageManager.homeIcon,
                            color: context.read<HomeBloc>().currentIndex == 0
                                ? ColorManager.primaryGreen
                                : ColorManager.greyForUnSleactedItem,
                          ),
                          Text(
                            AppLocalizations.of(context)!.store,
                            style: getUnderBoldStyle(
                                color:
                                    context.read<HomeBloc>().currentIndex == 0
                                        ? ColorManager.primaryGreen
                                        : ColorManager.greyForUnSleactedItem,
                                fontSize: FontSizeApp.s12),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<HomeBloc>().currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 25,
                            width: 25,
                            ImageManager.favoriteIcon,
                            color: context.read<HomeBloc>().currentIndex == 1
                                ? ColorManager.primaryGreen
                                : ColorManager.greyForUnSleactedItem,
                          ),
                          Text(
                            AppLocalizations.of(context)!.favorite,
                            style: getUnderBoldStyle(
                                color:
                                    context.read<HomeBloc>().currentIndex == 1
                                        ? ColorManager.primaryGreen
                                        : ColorManager.greyForUnSleactedItem,
                                fontSize: FontSizeApp.s12),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<HomeBloc>().currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageManager.basketIcon,
                            height: 25,
                            width: 25,
                            color: context.read<HomeBloc>().currentIndex == 2
                                ? ColorManager.primaryGreen
                                : ColorManager.greyForUnSleactedItem,
                          ),
                          Text(
                            AppLocalizations.of(context)!.basket,
                            style: getUnderBoldStyle(
                                color:
                                    context.read<HomeBloc>().currentIndex == 2
                                        ? ColorManager.primaryGreen
                                        : ColorManager.greyForUnSleactedItem,
                                fontSize: FontSizeApp.s12),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<HomeBloc>().currentIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageManager.homeIcon,
                            color: context.read<HomeBloc>().currentIndex == 3
                                ? ColorManager.primaryGreen
                                : ColorManager.greyForUnSleactedItem,
                          ),
                          Text(
                            AppLocalizations.of(context)!.my_order,
                            style: getUnderBoldStyle(
                                color:
                                    context.read<HomeBloc>().currentIndex == 3
                                        ? ColorManager.primaryGreen
                                        : ColorManager.greyForUnSleactedItem,
                                fontSize: FontSizeApp.s12),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<HomeBloc>().currentIndex = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageManager.profileIcon,
                            color: context.read<HomeBloc>().currentIndex == 4
                                ? ColorManager.primaryGreen
                                : ColorManager.greyForUnSleactedItem,
                          ),
                          Text(
                            AppLocalizations.of(context)!.my_Account,
                            style: getUnderBoldStyle(
                                color:
                                    context.read<HomeBloc>().currentIndex == 4
                                        ? ColorManager.primaryGreen
                                        : ColorManager.greyForUnSleactedItem,
                                fontSize: FontSizeApp.s12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: SizedBox(
        //   height: 70,
        //   child: Container(
        //     padding: EdgeInsets.zero,
        //     child: BottomNavigationBar(
        //         showUnselectedLabels: true,
        //         currentIndex: context.read<HomeBloc>().currentIndex,
        //         selectedItemColor: ColorManager.primaryGreen,
        //         unselectedItemColor: ColorManager.greyForUnSleactedItem,
        //         onTap: (value) {
        //           setState(() {
        //             context.read<HomeBloc>().currentIndex = value;
        //           });
        //         },
        //         items: [
        //           BottomNavigationBarItem(
        //               icon: Padding(
        //                 padding: EdgeInsets.zero,
        //                 child: Image.asset(
        //                   ImageManager.homeIcon,
        //                   color: context.read<HomeBloc>().currentIndex == 0
        //                       ? ColorManager.primaryGreen
        //                       : ColorManager.greyForUnSleactedItem,
        //                 ),
        //               ),
        //               label: AppLocalizations.of(context)!.store),
        //           BottomNavigationBarItem(
        //               icon: Padding(
        //                 padding: EdgeInsets.zero,
        //                 child: Image.asset(
        //                   ImageManager.favoriteIcon,
        //                   color: context.read<HomeBloc>().currentIndex == 1
        //                       ? ColorManager.primaryGreen
        //                       : ColorManager.greyForUnSleactedItem,
        //                 ),
        //               ),
        //               label: AppLocalizations.of(context)!.favorite),
        //           BottomNavigationBarItem(
        //               icon: Padding(
        //                 padding: EdgeInsets.zero,
        //                 child: Image.asset(
        //                   ImageManager.basketIcon,
        //                   color: context.read<HomeBloc>().currentIndex == 2
        //                       ? ColorManager.primaryGreen
        //                       : ColorManager.greyForUnSleactedItem,
        //                 ),
        //               ),
        //               label: AppLocalizations.of(context)!.basket),
        //           BottomNavigationBarItem(
        //               icon: Padding(
        //                 padding: EdgeInsets.zero,
        //                 child: Image.asset(
        //                   ImageManager.homeIcon,
        //                   color: context.read<HomeBloc>().currentIndex == 3
        //                       ? ColorManager.primaryGreen
        //                       : ColorManager.greyForUnSleactedItem,
        //                 ),
        //               ),
        //               label: AppLocalizations.of(context)!.my_order),
        //           BottomNavigationBarItem(
        //               icon: Padding(
        //                 padding: EdgeInsets.zero,
        //                 child: Image.asset(
        //                   ImageManager.profileIcon,
        //                   color: context.read<HomeBloc>().currentIndex == 4
        //                       ? ColorManager.primaryGreen
        //                       : ColorManager.greyForUnSleactedItem,
        //                 ),
        //               ),
        //               label: AppLocalizations.of(context)!.my_Account),
        //         ]),
        //   ),
        // ),
      ),
    );
  }
}
