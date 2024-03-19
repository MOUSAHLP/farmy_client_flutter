import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/models/my_order_response.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/state_buttons.dart';
import 'package:pharma/translations.dart';
import '../../../../core/get_address.dart';
import '../../../../models/params/get_basket_params.dart';
import '../../../widgets/custom_button.dart';

class BasketNotInstallCard extends StatelessWidget {
  const BasketNotInstallCard({super.key, required this.myOrder});

  final GetBasketParams myOrder;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
      child: Stack(
        children: [
          Container(
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
                      title:AppLocalizations.of(context)!.type_of_request,
                      details: "سلة غير مثبتة"),
                  RowOrder(
                      title: AppLocalizations.of(context)!.number_of_orders,
                      details: myOrder.idProducts!.length.toString()),
                  const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                    child: CustomButton(
                      label:AppLocalizations.of(context)!.install,
                      fillColor: ColorManager.yellow,
                      labelColor: Colors.white,
                      onTap: () {

                      },
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: CustomButton(
                      label:AppLocalizations.of(context)!.edit,
                      fillColor: ColorManager.yellow,
                      labelColor: Colors.white,
                      onTap: () {

                      },
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: CustomButton(
                      label:AppLocalizations.of(context)!.delete_Order,
                      fillColor: Colors.white,
                      labelColor: ColorManager.primaryGreen,
                      borderColor:ColorManager.primaryGreen
                      ,
                      isFilled: true,
                      onTap: () {

                      },
                    ),
                  ),

                ],)
                ],
              ),
            ),
          ),
          PositionedDirectional(
              top: 20,
              end: 20,
              child: SvgPicture.asset(IconsManager.basketNotInstall))
        ],
      ),
    );
  }
}
