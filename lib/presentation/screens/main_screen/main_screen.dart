import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_product/all_product_screen.dart';
import 'package:pharma/presentation/screens/basket_screen/basket_screen.dart';
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

  List<Widget> children = [
    Container(),
    AllLProductScreen(),
    const BasketScreen(),
    const OrderScreen(),
    const MyAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (scaffoldKey.currentState?.isDrawerOpen == true) {
          scaffoldKey.currentState?.closeDrawer();
        } else {
          WillPopScopeHandler.handle(context);
        }
        return false;
      },
      child: Scaffold(
        body: HomeScreen(scaffoldKey: scaffoldKey),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
              showUnselectedLabels: true,
              currentIndex: context.read<HomeBloc>().currentIndex,
              selectedItemColor: ColorManager.primaryGreen,
              unselectedItemColor: ColorManager.greyForUnSleactedItem,
              onTap: (value) {
                setState(() {
                  if (value != 0) {
                    AppRouter.push(context, children[value]);
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageManager.homeIcon,
                      color: context.read<HomeBloc>().currentIndex == 0
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSleactedItem,
                    ),
                    label: AppLocalizations.of(context)!.store),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageManager.favoriteIcon,
                      color: context.read<HomeBloc>().currentIndex == 1
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSleactedItem,
                    ),
                    label: AppLocalizations.of(context)!.favorite),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageManager.basketIcon,
                      color: context.read<HomeBloc>().currentIndex == 2
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSleactedItem,
                    ),
                    label: AppLocalizations.of(context)!.basket),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageManager.homeIcon,
                      color: context.read<HomeBloc>().currentIndex == 3
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSleactedItem,
                    ),
                    label: AppLocalizations.of(context)!.my_order),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageManager.profileIcon,
                      color: context.read<HomeBloc>().currentIndex == 4
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSleactedItem,
                    ),
                    label: AppLocalizations.of(context)!.my_Account),
              ]),
        ),
      ),
    );
  }
}
