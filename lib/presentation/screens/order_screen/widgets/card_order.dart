import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/state_buttons.dart';
import 'package:pharma/presentation/screens/rate_order/rate_order_screen.dart';
import 'package:pharma/translations.dart';
import '../../../../core/get_address.dart';
import '../../../../core/utils/formatter.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({super.key, required this.myOrder});

  final MyOrderResponse myOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          boxShadow: [ColorManager.shadowGaryRightDown],
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RowOrder(
                title: AppLocalizations.of(context)!.order_Number,
                details: myOrder.orderNumber.toString(),
              ),
              const SizedBox(height: 5),
              RowOrder(
                  title: AppLocalizations.of(context)!.address,
                  details: getAddress(myOrder.userAddress!)),
              SizedBox(height: 5.h),
              RowOrder(
                title: AppLocalizations.of(context)!.delivery_Type,
                details: myOrder.deliveryMethod?.name ?? "",
              ),
              SizedBox(height: 5.h),
              if (!myOrder.status!.contains("Deliverd") &&
                  !myOrder.status!.contains("Done") &&
                  !myOrder.status!.contains("Canceled")) ...[
                RowOrder(
                  title: AppLocalizations.of(context)!.expected_Time,
                  details: myOrder.expectedTime.toString() ?? "",
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
              myOrder.total != null
                  ? Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .total_Price_with_Delivery,
                          style: getBoldStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
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
                            "${Formatter.formatPrice(myOrder.total ?? 0) ?? ""}  ${AppLocalizations.of(context)!.curruncy}",
                            style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: 15.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 5,
              ),
              if (myOrder.status == "Done")
                myOrder.rate != null && myOrder.rate != 0.0
                    ? RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 22,
                        initialRating: myOrder.rate ?? 0.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        // itemPadding: const EdgeInsets.symmetric(horizontal: 22.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {},
                      )
                    : GestureDetector(
                        onTap: () {
                          AppRouter.push(
                              context, RateOrderScreen(orderId: myOrder.id));
                        },
                        child: Text(AppLocalizations.of(context)!.rate_order,
                            style: const TextStyle(
                                fontSize: 16,
                                color: ColorManager.gold,
                                fontWeight: FontWeight.bold)),
                      ),
              const SizedBox(
                height: 10,
              ),
              StateButtons(
                isSchedule: myOrder.deliveryMethod!.isSchedule!,
                status: myOrder.status ?? "",
                id: myOrder.id,
                expectedTime: myOrder.expectedTime,
              )
            ],
          ),
        ),
      ),
    );
  }
}
