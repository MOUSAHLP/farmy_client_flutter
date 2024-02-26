import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/basket_screen/widgets/card_basket.dart';
import 'package:pharma/presentation/screens/payment/payment_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../resources/font_app.dart';
import '../base_screen/base_screen.dart';
import '../guest_screen/guest_screen.dart';
import '../home_screen/widgets/custom_app_bar.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      backgroundColor: Colors.white,
      appbarTitle: AppLocalizations.of(context)!.basket,
      isComeBack: false,
      body: Column(
        children: [
          // const CustomAppBar(),
          // CustomAppBarScreen(
          //     sectionName: AppLocalizations.of(context)!.basket,
          //     isComeBack: false),
          sl<AuthenticationBloc>().loggedIn
              ? Expanded(
                  child: BlocConsumer<BasketBloc, BasketState>(
                    listener: (context, state) {
                      log(state.toString());
                      if (state.screenState == ScreenState.loading) {
                        LoadingDialog().openDialog(context);
                      } else {
                        LoadingDialog().closeDialog(context);
                      }
                      if (state.screenState == ScreenState.success) {
                        AppRouter.push(
                            context,
                            PaymentScreen(
                              paymentProcessResponse:
                                  state.paymentProcessResponse!,
                            ));
                      }
                      if (state.screenState == ScreenState.error) {
                        ErrorDialog.openDialog(context, state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          state.prductList!.isEmpty
                              ? CustomNoData(
                                  noDataStatment: AppLocalizations.of(context)!
                                      .sorryBasketIsEmpty)
                              : IntrinsicWidth(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.w, 5.h, 10.w, 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .final_product_appearance,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: getSemiBoldStyle(
                                                color:
                                                    ColorManager.grayForMessage,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          Expanded(
                            child: CustomOverscrollIndicator(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => CardBasket(
                                    productAddedToBasketDetails:
                                        state.prductList![index]),
                                itemCount: state.prductList!.length,
                              ),
                            ),
                          ),
                          state.prductList!.isEmpty
                              ? const SizedBox()
                              : Container(
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
                                              color:
                                                  ColorManager.grayForMessage,
                                              fontSize: 14)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              Formatter.formatPrice((context
                                                  .read<BasketBloc>()
                                                  .finalPrice())),
                                              style: getBoldStyle(
                                                  color:
                                                      ColorManager.primaryGreen,
                                                  fontSize: 24)),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .curruncy,
                                              style: getBoldStyle(
                                                      color: ColorManager
                                                          .primaryGreen,
                                                      fontSize: 15)!
                                                  .copyWith(height: 1))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 27, vertical: 9),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                label: AppLocalizations.of(
                                                        context)!
                                                    .proceed_to_checkout,
                                                fillColor:
                                                    ColorManager.primaryGreen,
                                                onTap: () {
                                                  context
                                                      .read<BasketBloc>()
                                                      .add(PaymentProcess());
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                label: AppLocalizations.of(
                                                        context)!
                                                    .continue_shopping,
                                                fillColor:
                                                    ColorManager.primaryGreen,
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
                      );
                    },
                  ),
                )
              : const Expanded(child: GuestScreen()),
        ],
      ),
    );
  }
}
