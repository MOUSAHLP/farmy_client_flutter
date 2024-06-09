import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_event.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/params/product_model.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/order_not_install_details_screen/widgets/card_details_order_not_install.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import '../../../bloc/basket_bloc/basket_bloc.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/setting_bloc/setting_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/formatter.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../../widgets/dialogs/time_work_dialog.dart';
import '../../widgets/dialogs/time_work_not_install_dialog.dart';
import '../base_screen/base_screen.dart';
import '../payment/payment_screen.dart';

class OrderNotInstallDetailsScreen extends StatelessWidget {
  final List<Product> id;
  final int idBasket;
  final bool isEdit;
  final bool instantInstall;

  const OrderNotInstallDetailsScreen({
    super.key,
    required this.id,
    this.isEdit = false,
    this.instantInstall = false,
    required this.idBasket,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<MyOrderBloc>()
          ..add(ShowBasket(idProducts: id, idBasket: idBasket));
      },
      child: OrderDetailsBody(
        id: id,
        isEdit: isEdit,
        idBasket: idBasket,
        instantInstall: instantInstall,
      ),
    );
  }
}

class OrderDetailsBody extends StatelessWidget {
  final List<Product> id;
  final bool isEdit;
  final bool instantInstall;
  final int idBasket;

  const OrderDetailsBody({
    super.key,
    required this.id,
    this.isEdit = false,
    this.instantInstall = false,
    required this.idBasket,
  });

  @override
  Widget build(BuildContext context) {
    bool s = true;

    return BaseScreenScaffold(
      backgroundColor: Colors.white,
      appbarTitle: AppLocalizations.of(context)!.order_details,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                AppLocalizations.of(context)!.payment_statment,
                style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s16,
                ),
              ),
            ),
            BlocConsumer<MyOrderBloc, MyOrderState>(
              listener: (context, state) {
                if (state.isLoadingConfirm) {
                  LoadingDialog().openDialog(context);
                } else {
                  LoadingDialog().closeDialog(context);
                }
                if (state.error != "") {
                  ErrorDialog.openDialog(context, state.error);
                }
                if (state.successConfirm) {
                  AppRouter.push(
                    context,
                    PaymentScreen(
                      rewardCouponsFixedValueModel: state.rewardCouponsFixedValueModel!,
                      paymentProcessResponse: state.paymentProcessResponse!,
                      myOrderBloc: context.read<MyOrderBloc>(),
                      idBasket: idBasket,
                    ),
                  );
                }
                if (state.quantityInBasket.isNotEmpty && instantInstall && s) {
                  context.read<BasketBloc>().add(const SaveIdToBasket(0));
                  checkIsOpening(context) == true
                      ? context.read<MyOrderBloc>().add(
                            PaymentProcessBasket(
                              idBasket,
                            ),
                          )
                      : TimeWorkNotInstallDialog().openDialog(
                          context,
                          () {
                            context.read<BasketBloc>().add(const SaveIdToBasket(0));
                            context.read<MyOrderBloc>().add(
                              PaymentProcessBasket(
                                idBasket,
                              ),
                            );
                            s = false;
                          },
                        );
                  s = false;
                }
              },
              builder: (context, state) {
                if (state.screenStates == ScreenStates.loading) {
                  return const Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: ColorManager.primaryGreen,
                  )));
                } else if (state.screenStates == ScreenStates.error) {
                  return Expanded(
                    child: CustomErrorScreen(
                      onTap: () {
                        // context.read<DetailsOrderBloc>().add(ShowDetailsOrder(id:id));
                      },
                      titleError: state.error,
                    ),
                  );
                }
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomOverscrollIndicator(
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                CardDetailsOrderNotInstall(
                              myOrderBloc: context.read<MyOrderBloc>(),
                              product: state.productList[index],
                              isEdit: isEdit,
                              idBasket: idBasket,
                              index: index,
                            ),
                            itemCount: state.productList.length,
                          ),
                        ),
                      ),
                      state.productList.isEmpty
                          ? const SizedBox()
                          : Container(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22.0.r),
                                    topRight: Radius.circular(22.0.r),
                                  ),
                                  boxShadow: [ColorManager.shadowGaryUp]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .total_price_without_delivery_with_tax,
                                    style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Formatter.formatPrice(state.totalPrice),
                                        style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.curruncy,
                                        style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: 15.sp,
                                        )!
                                            .copyWith(height: 1),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 27.h,
                                      vertical: 9.w,
                                    ),
                                    child: Row(
                                      children: [
                                        isEdit
                                            ? Expanded(
                                                child: CustomButton(
                                                  label: AppLocalizations.of(
                                                          context)!
                                                      .install,
                                                  fillColor:
                                                      ColorManager.primaryGreen,
                                                  onTap: () {
                                                    context
                                                        .read<BasketBloc>()
                                                        .add(
                                                            const SaveIdToBasket(
                                                                0));
                                                    checkIsOpening(context) ==
                                                            true
                                                        ? context
                                                            .read<MyOrderBloc>()
                                                            .add(
                                                              PaymentProcessBasket(
                                                                idBasket,
                                                              ),
                                                            )
                                                        : TimeWorkNotInstallDialog()
                                                            .openDialog(
                                                            context,
                                                            () {
                                                              print('###########');
                                                              context.read<BasketBloc>().add(const SaveIdToBasket(0));
                                                              context.read<MyOrderBloc>().add(
                                                                PaymentProcessBasket(
                                                                  idBasket,
                                                                ),
                                                              );
                                                              s = false;
                                                            },
                                                          );
                                                  },
                                                ),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            label: AppLocalizations.of(context)!
                                                .back,
                                            fillColor:
                                                ColorManager.primaryGreen,
                                            labelColor: Colors.white,
                                            onTap: () {
                                              context
                                                  .read<BasketBloc>()
                                                  .add(const SaveIdToBasket(0));
                                              AppRouter.pop(context);
                                              // SystemNavigator.pop();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            label: AppLocalizations.of(context)!
                                                .add_product,
                                            fillColor:
                                                ColorManager.primaryGreen,
                                            labelColor: Colors.white,
                                            onTap: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .currentIndex = 0;
                                              context.read<BasketBloc>().add(
                                                  SaveIdToBasket(idBasket));
                                              AppRouter.push(
                                                  context, const HomeScreen());
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
                );
              },
            )
          ],
        ),
      ),
      //  drawer: const CustomAppDrawer(),
    );
  }

  bool checkIsOpening(BuildContext context) {
    DateTime dateTime = DateTime.now();
    List<String> endTime =
        (context.read<SettingBloc>().settingModel!.data!.openingTimes!.endTime)
            .split(":");
    print(
        "======================================================================");
    print(dateTime.hour);
    print(
        "======================================================================");
    print(endTime[0]);
    print(
        "======================================================================");
    if (int.parse(endTime[0]) > dateTime.hour) {
      return true;
    } else if (int.parse(endTime[0]) == dateTime.hour) {
      if (int.parse(endTime[1]) > dateTime.minute) {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }
}
