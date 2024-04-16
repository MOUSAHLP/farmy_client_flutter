import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:pharma/core/utils/formatter.dart';

import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/translations.dart';

import '../../bloc/favorite_bloc/favorite_event.dart';
import '../../bloc/favorite_bloc/favorite_state.dart';
import '../../models/product_response.dart';
import 'favorite_heart.dart';

class CustomProductCard extends StatelessWidget {
  final ProductResponse productInfo;

  const CustomProductCard({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            6,
          ),
        ),
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
            width: 164.w,
            height: 218.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 144.h,
                    color: ColorManager.grayForPlaceholder,
                    child: CachedImage(
                      width: 163.w,
                      imageUrl: productInfo.image,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 7.h),
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
                                          fontSize: FontSizeApp.s10,
                                        )!
                                            .copyWith(height: 1),
                                      )
                                    : const SizedBox(),
                                // const SizedBox(
                                //   height: 4,
                                // ),
                                // productInfo.sellerName != null
                                //     ? Text(
                                //         "(${productInfo.sellerName!})",
                                //         style: getBoldStyle(
                                //           color: ColorManager.primaryGreen,
                                //           fontSize: FontSizeApp.s10,
                                //         )!
                                //             .copyWith(
                                //           height: 1,
                                //         ),
                                //       )
                                //     : const SizedBox(),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 4),
                          //   child: Row(
                          //     children: [
                          // todo wazn
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
                          // if (productInfo.quantity != null)
                          //   Text(
                          //     "${productInfo.quantity} قطعة",
                          //     style: getRegularStyle(
                          //       color: ColorManager.grayForMessage,
                          //       fontSize: FontSizeApp.s10,
                          //     )!
                          //         .copyWith(
                          //       height: 1,
                          //     ),
                          //   ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding:  EdgeInsets.only(top: 3.h),
                            child: Row(
                              children: [
                                Text(
                                  productInfo.price ?? "",
                                  style: getRegularStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s12,
                                  )!
                                      .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.curruncy,
                                  style: getRegularStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s13,
                                  )!
                                      .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.h, bottom: 0),
                            child: Row(
                              children: [
                                if (productInfo.price != null)
                                  Text(
                                    Formatter.formatPrice(
                                      int.tryParse(
                                            productInfo.discountValue ?? "0",
                                          ) ??
                                          0,
                                    ),
                                    style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s15,
                                    )!
                                        .copyWith(
                                      height: 1,
                                    ),
                                  ),
                                const SizedBox(width: 1),
                                //todo caruncy
                                if (productInfo.price != null)
                                  Text(
                                    AppLocalizations.of(context)!.curruncy,
                                    style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s13,
                                    )!
                                        .copyWith(
                                      height: 1,
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              return FavoriteHeart(
                                id: productInfo.id ?? 0,
                                isToggled: productInfo.isFavorite,
                                onTap: () {
                                  context.read<FavoriteBloc>().add(
                                        ChangeFavoriteStatusProduct(
                                            productInfo.id, productInfo),
                                      );
                                  // context.read<FavoriteBloc>().add(
                                  //       ChangeFavoriteStatusRestaurant(
                                  //         productInfo.id ?? 0,
                                  //         productInfo
                                  //       ),
                                  //     );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          productInfo.discount != null
              ? ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(6),
                    bottomStart: Radius.circular(6),
                  ),
                  child: Container(
                    color: ColorManager.redForFavorite,
                    height: 18,
                    width: 76,
                    child: Center(
                      child: Text(
                        "${AppLocalizations.of(context)!.discount} ${productInfo.discount} %",
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSizeApp.s7,
                        )!
                            .copyWith(),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

// class FavoriteHeart extends StatelessWidget {
//   const FavoriteHeart({
//     super.key,
//     required this.productInfo,
//   });
//
//   final ProductsBySubCategoryIdResponse productInfo;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<FavoriteBloc>().add(
//             ChangeFavoriteStatusRestaurant(
//                 productInfo.id??0));
//         // context.read<FavoriteBloc>().add(
//         //     ToggleFavorite(
//         //         isFavorite: !state.isFavorite!));
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Icon(
//           color: context
//               .read<FavoriteBloc>()
//               .isFavoriteRestaurant(productInfo.id??0) == true
//               ? Colors.red
//               : Colors.black,
//           context
//               .read<FavoriteBloc>()
//               .isFavoriteRestaurant(productInfo.id??0) == true
//
//               ? Icons.favorite
//               :
//           Icons.favorite_border_outlined,
//           size: 26,
//         ),
//       ),
//     );
//   }
// }
