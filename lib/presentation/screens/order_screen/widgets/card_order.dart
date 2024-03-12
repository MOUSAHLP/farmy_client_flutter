import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/state_buttons.dart';
import 'package:pharma/translations.dart';
import '../../../../core/get_address.dart';

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
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              RowOrder(
                  title: AppLocalizations.of(context)!.order_Number,
                  details: myOrder.orderNumber.toString()),
              RowOrder(
                  title: AppLocalizations.of(context)!.address,
                  details: getAddress(myOrder.userAddress!)),
              RowOrder(
                  title: AppLocalizations.of(context)!.delivery_Type,
                  details: myOrder.deliveryMethod?.name ?? ""),
              RowOrder(
                  title: AppLocalizations.of(context)!.expected_Time,
                  details: myOrder.expectedTime.toString() ?? ""),
              myOrder.total != null
                  ? Row(
                      children: [
                        Text(
                            AppLocalizations.of(context)!
                                .total_Price_with_Delivery,
                            style: getBoldStyle(
                                color: Colors.black, fontSize: 11)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(":",
                              style: getBoldStyle(
                                  color: Colors.black, fontSize: 11)),
                        ),
                        Expanded(
                          child: Text("${myOrder.total ?? ""}  ${AppLocalizations.of(context)!.curruncy}",
                              style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: 15),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    )
                  : const SizedBox(),
       //      Text(myOrder.status??""),
               StateButtons(status:myOrder.status??"" ,id: myOrder.id,)
            ],
          ),
        ),
      ),
    );
  }
}
