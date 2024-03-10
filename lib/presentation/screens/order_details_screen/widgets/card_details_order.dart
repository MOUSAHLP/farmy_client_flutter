import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../models/order_details_model.dart';
import '../../../../translations.dart';

class CardDetailsOrder extends StatelessWidget {
  final OrderDetailsModel productAddedToBasketDetails;
  final Function? onTapDelete;
  final Color? cardColor;

  const CardDetailsOrder(
      {super.key,
      required this.productAddedToBasketDetails,
      this.onTapDelete,
      this.cardColor});

  @override
  Widget build(BuildContext context) {
    print("productAddedToBasketDetails.price" );
    print(productAddedToBasketDetails.price );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
      child: Container(
        height: 120.h,
        width: 1.sw,
        decoration: BoxDecoration(
            boxShadow: [
              cardColor != null
                  ? ColorManager.shadowRedDown
                  : ColorManager.shadowGaryDown
            ],
            color: cardColor ?? Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const Spacer(),
            if (onTapDelete != null)
              Expanded(
                child: SizedBox(
                  height: 38.w,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 14.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: const [
                            BoxShadow(
                              color: ColorManager.grayForMessage,
                              offset: Offset(0, 1.5),
                              blurRadius: 1,
                              spreadRadius: 0,
                            ),
                          ]),
                      child: const Icon(
                        Icons.close,
                        color: ColorManager.redForFavorite,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    productAddedToBasketDetails.product?.nameOfProduct ?? "",
                    style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSizeApp.s10)
                        ?.copyWith(height: 1),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          productAddedToBasketDetails.price != null
                              ? Text(
                                  productAddedToBasketDetails.price ??
                                      "",
                                  style: getBoldStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s15,
                                  ))
                              : const SizedBox(),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                                  productAddedToBasketDetails.price ??""
                                     ,
                          style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s15)!
                              .copyWith(height: 1)),
                      const SizedBox(width: 1),
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
            ),
            const SizedBox(width: 19),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  height: 120.h,
                  color: ColorManager.grayForPlaceholder,
                  child: CachedImage(
                    imageUrl: productAddedToBasketDetails.product?.image??"",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
