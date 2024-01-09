import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/translations.dart';

import '../../core/utils/formatter.dart';

class CustomProductCard extends StatelessWidget {
  final bool? isDisCount;
  final bool? isSellerFound;
  final ProductsBySubCategoryIdResponse productInfo;
  const CustomProductCard(
      {super.key,
      required this.isDisCount,
      required this.isSellerFound,
      required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.18),
            offset: const Offset(0, 2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          SizedBox(
            width: 163,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 144,
                    color: ColorManager.grayForPlaceholde,
                    child: CachedImage(
                      width: 163,
                      imageUrl: productInfo.image,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                productInfo.nameOfProduct != null
                                    ? Text(
                                        productInfo.nameOfProduct!,
                                        style: getBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSizeApp.s10)!
                                            .copyWith(height: 1),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 4,
                                ),
                                productInfo.sellerName != null
                                    ? Text(
                                        "(${productInfo.sellerName!})",
                                        style: getBoldStyle(
                                                color:
                                                    ColorManager.primaryGreen,
                                                fontSize: FontSizeApp.s10)!
                                            .copyWith(height: 1),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                //todo wazn
                                // Row(
                                //   children: [
                                //     Text(
                                //       "400 غ",
                                //       style: getRegularStyle(
                                //               color: ColorManager.grayForMessage,
                                //               fontSize: FontSizeApp.s13)!
                                //           .copyWith(height: 1),
                                //     ),
                                //     Text(
                                //       " / ",
                                //       style: getRegularStyle(
                                //               color: ColorManager.grayForMessage,
                                //               fontSize: FontSizeApp.s13)!
                                //           .copyWith(height: 1),
                                //     ),
                                //   ],
                                // ),
                                if (productInfo.quantity != null)
                                  Text(
                                    "${productInfo.quantity} قطعة",
                                    style: getRegularStyle(
                                            color: ColorManager.grayForMessage,
                                            fontSize: FontSizeApp.s10)!
                                        .copyWith(height: 1),
                                  ),
                              ],
                            ),
                          ),
                          isDisCount!
                              ? Row(
                                  children: [
                                    Text(productInfo.discountValue!,
                                        style: getRegularStyle(
                                                color:
                                                    ColorManager.grayForMessage,
                                                fontSize: FontSizeApp.s12)!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                height: 1)),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(AppLocalizations.of(context)!.curruncy,
                                        style: getRegularStyle(
                                                color:
                                                    ColorManager.grayForMessage,
                                                fontSize: FontSizeApp.s7)!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                height: 1)),
                                  ],
                                )
                              : const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 0),
                            child: Row(
                              children: [
                                if (productInfo.price != null)
                                  Text(Formatter.formatPrice(double.parse(productInfo.price!)),
                                      style: getBoldStyle(
                                              color: ColorManager.primaryGreen,
                                              fontSize: FontSizeApp.s15)!
                                          .copyWith(height: 1)),
                                const SizedBox(
                                  width: 1,
                                ),
                                //todo caruncy
                                if (productInfo.price != null)
                                  Text(AppLocalizations.of(context)!.curruncy,
                                      style: getBoldStyle(
                                              color: ColorManager.primaryGreen,
                                              fontSize: FontSizeApp.s10)!
                                          .copyWith(height: 1))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 74,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          isDisCount == true
              ? ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(6),
                      bottomEnd: Radius.circular(6)),
                  child: Container(
                    color: ColorManager.redForFavorite,
                    height: 18,
                    width: 76,
                    child: Center(
                        child: Text(
                      "${AppLocalizations.of(context)!.discount} ${productInfo.discount} %",
                      style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSizeApp.s7)!
                          .copyWith(),
                    )),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }


}
