import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_router/app_router.dart';
import '../../../../translations.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../order_tracking_screen/order_tracking_screen.dart';
import '../../rate_order/rate_order_screen.dart';
class StateButtons extends StatelessWidget {
   StateButtons({Key? key, required this.status}) : super(key: key);
  final String status;
  final List<Widget> buttons = [];
  @override
  Widget build(BuildContext context) {


    if (status != "Pending") {
      buttons.add(
        CustomButton(
          width: 1.sw - 302,
          label: AppLocalizations.of(context)!.show_Order,
          fillColor: ColorManager.primaryGreen,
          onTap: () {},
        ),
      );
    }

    if (status != "Deliverd" && status != "Pending" && status != "Cancelled") {
      buttons.add(
        CustomButton(
          width: 1.sw - 302,
          label: AppLocalizations.of(context)!.track_Order,
          fillColor: ColorManager.primaryGreen,
          labelColor: Colors.white,
          onTap: () {
            AppRouter.push(context, const OrderTrackingScreen());
            // SystemNavigator.pop();
          },
        ),
      );
    }

    if (status == "Pending") {
      buttons.add(
        CustomButton(
          width: 1.sw - 302,
          label: AppLocalizations.of(context)!.edit_Orders,
          fillColor: ColorManager.primaryGreen,
          labelColor: Colors.white,
          onTap: () {
            AppRouter.push(context, const RateOrderScreen());
            // SystemNavigator.pop();
          },
        ),
      );

      buttons.add(
        CustomButton(
          width: 1.sw - 302,
          label: AppLocalizations.of(context)!.edit_Information,
          fillColor: ColorManager.primaryGreen,
          labelColor: Colors.white,
          onTap: () {},
        ),
      );
    }

    if (status == "Returned") {
      buttons.add(
        CustomButton(
          width: 1.sw - 301,
          label: "مرتجع",
          isFilled: true,
          fillColor: ColorManager.yellow,
          labelColor: Colors.white,
          onTap: () {},
        ),
      );
    }

    if (status == "Pending") {
      buttons.add(
        CustomButton(
          width: 1.sw - 302,
          label: "حذف",
          fillColor: ColorManager.yellow,
          labelColor: Colors.white,
          onTap: () {},
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        spacing: 2,
        runSpacing: 4,
        alignment: WrapAlignment.start,
        children: buttons,
      ),
    );
  }
}

