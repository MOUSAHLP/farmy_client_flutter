import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../translations.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../order_details_screen/order_details_screen.dart';
import '../../order_tracking_screen/order_tracking_screen.dart';

class StateButtons extends StatelessWidget {
  const StateButtons({
    Key? key,
    required this.status,
    required this.id,
    required this.expectedTime,
    required this.isSchedule,
  }) : super(key: key);
  final String status;
  final bool isSchedule;
  final int id;
  final int expectedTime;

  @override
  Widget build(BuildContext context) {
    Widget getButtonsBasedOnStatus(String status) {
      List<Widget> buttons;
      switch (status) {
        case "Pending":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 2),
            // if (isSchedule)
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.edit_Orders,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                      isEdit: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 2),
            // if (isSchedule)
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.delete_Order,
                fillColor: Colors.white,
                borderColor: ColorManager.primaryGreen,
                isFilled: true,
                labelColor: ColorManager.primaryGreen,
                onTap: () {
                  context.read<MyOrderBloc>().add(
                        DeleteOrder(
                          id: id,
                        ),
                      );
                  //DeleteOrder
                },
              ),
            ),
          ];
          break;
        case "Confirmed":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                    ),
                  );
                },
              ),
            ),
          ];
          break;
        // case "Confirmed":
        case "OnDelivery":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 2),
            // if (!isSchedule)
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.track_Order,
                fillColor: Colors.white,
                borderColor: ColorManager.primaryGreen,
                isFilled: true,
                labelColor: ColorManager.primaryGreen,
                onTap: () {
                  AppRouter.push(
                    context,
                    OrderTrackingScreen(
                      expectedTime: expectedTime,
                      orderId: id,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 2),
            // if (!isSchedule)
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.returned,
                fillColor: ColorManager.grayForMessage,
                isFilled: true,
                labelColor: Colors.white,
                borderColor: ColorManager.grayForMessage,
                onTap: () {},
              ),
            ),
          ];
          break;

        case "Deliverd":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                      isDelivery: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.returned,
                fillColor: ColorManager.yellow,
                isFilled: true,
                labelColor: Colors.white,
                borderColor: ColorManager.yellow,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                      isDelivery: false,
                      isDelivered: true,
                    ),
                  );
                },
              ),
            ),
          ];
          break;
        case "Done":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                      isDelivery: true,
                    ),
                  );
                },
              ),
            ),
          ];
          break;
        case "Cancelled":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                    ),
                  );
                },
              ),
            ),
          ];
          break;
        case "Returned":
          buttons = [
            Expanded(
              child: CustomButton(
                height: 38.h,
                radius: 6.r,
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(
                    context,
                    OrderDetailsScreen(
                      id: id,
                    ),
                  );
                },
              ),
            ),
          ];
          break;
        default:
          return const Text("");
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons,
      );
    }

    return getButtonsBasedOnStatus(status);
  }
}
