import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/order_tracking_screen/order_tracking_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Column(
            children: [
              RowOrder(
                  title: AppLocalizations.of(context)!.order_Number,
                  details: "111"),
              RowOrder(
                  title: AppLocalizations.of(context)!.address,
                  details: "دمشق - كزرنيش التجارة - بناء 24"),
              RowOrder(
                  title: AppLocalizations.of(context)!.delivery_Type,
                  details: "التوصيل الآن"),
              RowOrder(
                  title: AppLocalizations.of(context)!.expected_Time,
                  details: "30 دقيقة"),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.total_Price_with_Delivery,
                      style: getBoldStyle(color: Colors.black, fontSize: 11)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(":",
                        style: getBoldStyle(color: Colors.black, fontSize: 11)),
                  ),
                  Expanded(
                    child: Text(" 225.000 ل.س",
                        style: getBoldStyle(
                            color: ColorManager.primaryGreen, fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8 ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label:AppLocalizations.of(context)!.show_Order,
                        fillColor: ColorManager.primaryGreen,

                        onTap: () {
                          // AppRouter.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomButton(
                        label:AppLocalizations.of(context)!.track_Order,
                        fillColor: ColorManager.primaryGreen,

                        labelColor:Colors.white ,

                        onTap: () {
                          AppRouter.push(context, OrderTrackingScreen());
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
