import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_bloc.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/payment/payment_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/time_work_not_install_dialog.dart';
import 'package:pharma/translations.dart';
import '../../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../../models/params/get_basket_params.dart';
import '../../../widgets/custom_button.dart';
import '../../order_not_install_details_screen/order_not_install_details_screen.dart';

class BasketNotInstallCard extends StatelessWidget {
  const BasketNotInstallCard({super.key, required this.myOrder});

  final GetBasketParams myOrder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrderBloc, MyOrderState>(listener: (context, state) {
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
            idBasket: myOrder.id,
          ),
        );
      }
      if (state.quantityInBasket.isNotEmpty) {
        context.read<MyOrderBloc>().productInBasketList =
            state.quantityInBasket;
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 37),
        child: Stack(
          children: [
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                boxShadow: [ColorManager.shadowGaryRightDown],
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  6.0.r,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                      ),
                      child: Column(
                        children: [
                          RowOrder(
                            title:
                                AppLocalizations.of(context)!.type_of_request,
                            details: AppLocalizations.of(context)!.basket_not_installed,
                          ),
                          SizedBox(height: 5.h),
                          RowOrder(
                            title:
                                AppLocalizations.of(context)!.number_of_orders,
                            details: "${myOrder.products.length} ${AppLocalizations.of(context)!.order}",
                          ),
                          SizedBox(height: 10.0.h),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .total_price_without_delivery,
                                style: getBoldStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Text(
                                  ":",
                                  style: getBoldStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${Formatter.formatPrice(myOrder.price)}  ${AppLocalizations.of(context)!.curruncy}",
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: 15.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0.h),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              height: 38.h,
                              radius: 6.w,
                              label: AppLocalizations.of(context)!.edit_Orders,
                              fillColor: ColorManager.yellow,
                              labelColor: Colors.white,
                              onTap: () {
                                AppRouter.push(
                                  context,
                                  OrderNotInstallDetailsScreen(
                                    id: myOrder.products,
                                    isEdit: true,
                                    idBasket: myOrder.id,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: CustomButton(
                              height: 38.h,
                              radius: 6.w,
                              label: AppLocalizations.of(context)!.install,
                              fillColor: ColorManager.yellow,
                              labelColor: Colors.white,
                              onTap: () {
                                AppRouter.push(
                                  context,
                                  OrderNotInstallDetailsScreen(
                                    id: myOrder.products,
                                    isEdit: true,
                                    idBasket: myOrder.id,
                                    instantInstall: true,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: CustomButton(
                              height: 38.0.h,
                              radius: 6.0.h,
                              label: AppLocalizations.of(context)!.delete_Order,
                              fillColor: Colors.white,
                              labelColor: ColorManager.primaryGreen,
                              borderColor: ColorManager.primaryGreen,
                              isFilled: true,
                              onTap: () {
                                context.read<MyOrderBloc>().add(
                                      DeleteBasket(
                                        idBasket: myOrder.id,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: 20.h,
              end: 20.w,
              child: SvgPicture.asset(IconsManager.basketNotInstall),
            )
          ],
        ),
      );
    });
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
