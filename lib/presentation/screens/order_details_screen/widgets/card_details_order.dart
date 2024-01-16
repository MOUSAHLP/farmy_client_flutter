import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../models/order_details_model.dart';
import '../../../../translations.dart';

class CardDetailsOrder extends StatelessWidget {
  final OrderDetailsModel productAddedToBasketDetails;
  const CardDetailsOrder({super.key, required this.productAddedToBasketDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
      child: Container(
        height: 115,
        width: 1.sw,
        decoration: BoxDecoration(
            boxShadow: [ColorManager.shadowGaryDown],
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  productAddedToBasketDetails.product?.name??"",
                  style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSizeApp.s10)
                      ?.copyWith(height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      productAddedToBasketDetails.product?.price != null
                          ? Text(productAddedToBasketDetails.product!.price??"",
                          style: getBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s15,
                          ))
                          : const SizedBox(),
                    ],
                  )
                ),
                Row(
                  children: [
                      Text(
                          Formatter.formatPrice(
                              int.tryParse(productAddedToBasketDetails.product!.price??"")??0),
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s15)!
                              .copyWith(height: 1)),
                    const SizedBox(
                      width: 1,
                    ),
                    //todo caruncy
                    if (productAddedToBasketDetails.price != null)
                      Text(AppLocalizations.of(context)!.curruncy,
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s10)!
                              .copyWith(height: 1))
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 19,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 115,
                color: ColorManager.grayForPlaceholde,
                child:  CachedImage(
                  imageUrl: productAddedToBasketDetails.product?.image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
