import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';

import '../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../bloc/basket_bloc/basket_bloc.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import '../../core/services/services_locator.dart';
import '../../translations.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_app.dart';
import '../resources/style_app.dart';
import '../screens/basket_screen/basket_screen.dart';
import '../screens/favorite/favorite_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/my_account_screen/my_account_screen.dart';
import '../screens/order_screen/order_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const HomeScreen(),
      const AllFavoritesScreen(),
      const BasketScreen(),
      const OrderScreen(),
      const MyAccountScreen(),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
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
                  AppRouter.pushAndRemoveAllStack(
                      context, children[context.read<HomeBloc>().currentIndex]);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    height: 25,
                    width: 25,
                    ImageManager.homeIcon,
                    color: context.read<HomeBloc>().currentIndex == 0
                        ? ColorManager.primaryGreen
                        : ColorManager.greyForUnSelectedItem,
                  ),
                  Text(
                    AppLocalizations.of(context)!.store,
                    style: getUnderBoldStyle(
                        color: context.read<HomeBloc>().currentIndex == 0
                            ? ColorManager.primaryGreen
                            : ColorManager.greyForUnSelectedItem,
                        fontSize: FontSizeApp.s12),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  context.read<HomeBloc>().currentIndex = 1;
                  AppRouter.pushAndRemoveAllStack(
                      context, children[context.read<HomeBloc>().currentIndex]);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    height: 25,
                    width: 25,
                    ImageManager.favoriteIcon,
                    color: context.read<HomeBloc>().currentIndex == 1
                        ? ColorManager.primaryGreen
                        : ColorManager.greyForUnSelectedItem,
                  ),
                  Text(
                    AppLocalizations.of(context)!.favorite,
                    style: getUnderBoldStyle(
                        color: context.read<HomeBloc>().currentIndex == 1
                            ? ColorManager.primaryGreen
                            : ColorManager.greyForUnSelectedItem,
                        fontSize: FontSizeApp.s12),
                  )
                ],
              ),
            ),
            BlocConsumer<BasketBloc, BasketState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        context.read<HomeBloc>().currentIndex = 2;
                        AppRouter.pushAndRemoveAllStack(context,
                            children[context.read<HomeBloc>().currentIndex]);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SvgPicture.asset(
                              ImageManager.basketIcon,
                              height: 25,
                              width: 25,
                              color: context.read<HomeBloc>().currentIndex == 2
                                  ? ColorManager.primaryGreen
                                  : ColorManager.greyForUnSelectedItem,
                            ),
                            context
                                    .read<BasketBloc>()
                                    .mutableProducts
                                    .isNotEmpty
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: context
                                                    .read<HomeBloc>()
                                                    .currentIndex ==
                                                2
                                            ? Colors.white
                                            : ColorManager.primaryGreen,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        context
                                            .read<BasketBloc>()
                                            .mutableProducts
                                            .length
                                            .toString(),
                                        style: getBoldStyle(
                                            color: context
                                                        .read<HomeBloc>()
                                                        .currentIndex ==
                                                    2
                                                ? ColorManager.primaryGreen
                                                : Colors.white),
                                      ),
                                    ))
                                : SizedBox()
                          ],
                        ),
                        Text(
                          AppLocalizations.of(context)!.basket,
                          style: getUnderBoldStyle(
                              color: context.read<HomeBloc>().currentIndex == 2
                                  ? ColorManager.primaryGreen
                                  : ColorManager.greyForUnSelectedItem,
                              fontSize: FontSizeApp.s12),
                        )
                      ],
                    ),
                  );
                }),
            GestureDetector(
              onTap: () {
                setState(() {
                  context.read<HomeBloc>().currentIndex = 3;
                  context.read<BasketBloc>().add(SaveIdToBasket(0));
                  AppRouter.pushAndRemoveAllStack(
                      context, children[context.read<HomeBloc>().currentIndex]);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageManager.myOrder,
                    color: context.read<HomeBloc>().currentIndex == 3
                        ? ColorManager.primaryGreen
                        : ColorManager.greyForUnSelectedItem,
                  ),
                  Text(
                    AppLocalizations.of(context)!.my_order,
                    style: getUnderBoldStyle(
                      color: context.read<HomeBloc>().currentIndex == 3
                          ? ColorManager.primaryGreen
                          : ColorManager.greyForUnSelectedItem,
                      fontSize: FontSizeApp.s12.sp,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  context.read<HomeBloc>().currentIndex = 4;
                  AppRouter.pushAndRemoveAllStack(
                      context, children[context.read<HomeBloc>().currentIndex]);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SvgPicture.asset(
                        ImageManager.profileIcon,
                        color: context.read<HomeBloc>().currentIndex == 4
                            ? ColorManager.primaryGreen
                            : ColorManager.greyForUnSelectedItem,
                      ),
                      sl<AuthenticationBloc>().loggedIn
                          ? const SizedBox()
                          : const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 18,
                            )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.my_Account,
                    style: getUnderBoldStyle(
                        color: context.read<HomeBloc>().currentIndex == 4
                            ? ColorManager.primaryGreen
                            : ColorManager.greyForUnSelectedItem,
                        fontSize: FontSizeApp.s12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
