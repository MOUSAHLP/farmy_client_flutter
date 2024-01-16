import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';


class CustomTotalPrice extends StatelessWidget {
  final Function() onCompletePayment;
  final Function() onCompleteShopping;
  final String totoalPrice;
  final String title;

  const CustomTotalPrice(
      {super.key,
      required this.title,
      required this.totoalPrice,
      required this.onCompletePayment,
      required this.onCompleteShopping});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22)),
          boxShadow: [ColorManager.shadowGaryUp]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 9,
          ),
          Text(title,
              style: getBoldStyle(
                  color: ColorManager.grayForMessage, fontSize: 14)),
          Text(totoalPrice.toString(),
              style:
                  getBoldStyle(color: ColorManager.primaryGreen, fontSize: 24)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      label: AppLocalizations.of(context)!.proceed_to_checkout,
                      fillColor: ColorManager.primaryGreen,
                      onTap: onCompletePayment),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                      label: AppLocalizations.of(context)!.continue_shopping,
                      fillColor: ColorManager.primaryGreen,
                      labelColor: Colors.white,
                      onTap: onCompleteShopping),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}
