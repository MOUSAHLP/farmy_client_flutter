import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/basket_screen/widgets/card_basket.dart';
import 'package:pharma/presentation/screens/payment/payment_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketBloc, BasketState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(children: [
                  CustomAppBarScreen(
                      sectionName: AppLocalizations.of(context)!.basket),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 37, vertical: 11),
                    child: Text(
                        AppLocalizations.of(context)!.final_product_appearance,
                        style: getRegularStyle(
                            color: ColorManager.grayForMessage)),
                  ),
                  Expanded(
                    child: CustomOverscrollIndicator(
                      child: ListView.builder(
                        itemBuilder: (context, index) => const CardBasket(),
                        itemCount: 30,
                      ),
                    ),
                  )
                ]),
                Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22)),
                      boxShadow: [ColorManager.shadowGaryUp]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                          AppLocalizations.of(context)!
                              .total_price_without_delivery,
                          style: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: 14)),
                      Text("200,000 sy",
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen, fontSize: 24)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 9),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                label: AppLocalizations.of(context)!
                                    .proceed_to_checkout,
                                fillColor: ColorManager.primaryGreen,
                                onTap: () {
                                  AppRouter.push(
                                      context, const PaymentScreen());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: CustomButton(
                                label: AppLocalizations.of(context)!
                                    .continue_shopping,
                                fillColor: ColorManager.primaryGreen,
                                labelColor: Colors.white,
                                onTap: () {
                                  // SystemNavigator.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
