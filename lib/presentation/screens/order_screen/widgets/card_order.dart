import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/order_tracking_screen/order_tracking_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

import '../../../../core/get_address.dart';
import '../../order_details_screen/order_details_screen.dart';
import '../../rate_order/rate_order_screen.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({super.key,required this.myOrder});
final  MyOrderResponse myOrder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
            boxShadow: [ColorManager.shadowGaryRightDown],
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              RowOrder(
                  title: AppLocalizations.of(context)!.order_Number,
                  details: myOrder.orderNumber??""),
              RowOrder(
                  title: AppLocalizations.of(context)!.address,
                  details: getAddress(myOrder.userAddress!)),
              RowOrder(
                  title: AppLocalizations.of(context)!.delivery_Type,
                  details:myOrder.deliveryMethod?.name??"" ),
              RowOrder(
                  title: AppLocalizations.of(context)!.expected_Time,
                  details: " 30 دقيقة"),
              myOrder.total != null? Row(
                children: [
                  Text(AppLocalizations.of(context)!.total_Price_with_Delivery,
                      style:
                          getBoldStyle(color: Colors.black, fontSize: 11)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(":",
                        style: getBoldStyle(
                            color: Colors.black, fontSize: 11)),
                  ),
                  Expanded(
                    child: Text(myOrder.total??"",
                        style: getBoldStyle(
                            color: ColorManager.primaryGreen, fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ):const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: AppLocalizations.of(context)!.show_Order,
                        fillColor: ColorManager.primaryGreen,
                        onTap: () {
                         AppRouter.push(context, OrderDetailsScreen(orderDetailsList:myOrder.orderDetailsList??[],));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomButton(
                        label: AppLocalizations.of(context)!.track_Order,
                        fillColor: ColorManager.primaryGreen,
                        labelColor: Colors.white,
                        onTap: () {
                          AppRouter.push(context, const OrderTrackingScreen());
                          // SystemNavigator.pop();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomButton(
                        label: AppLocalizations.of(context)!.edit_Orders,
                        fillColor: ColorManager.primaryGreen,
                        labelColor: Colors.white,
                        onTap: () {
                          AppRouter.push(context, const RateOrderScreen());
                          // SystemNavigator.pop();
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
    );
  }
}
