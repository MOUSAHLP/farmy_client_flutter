import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../translations.dart';
import '../../../widgets/dialogs/confirm_delete_product_dialog.dart';

class CardBasket extends StatelessWidget {
  final ProductDetailsResponse productAddedToBasketDetails;

  const CardBasket({super.key, required this.productAddedToBasketDetails});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 37),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 115,
              width: 1.sw,
              decoration: BoxDecoration(
                  boxShadow: [ColorManager.shadowGaryDown],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5),
                    child: buildCounterWidget(context),
                  ),
                  // const Spacer(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        productAddedToBasketDetails.nameOfProduct != null
                            ? Text(
                                productAddedToBasketDetails.nameOfProduct ?? "",
                                style: getBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSizeApp.s10)
                                    ?.copyWith(
                                  height: 2,
                                  overflow: TextOverflow.fade,
                                ),
                                maxLines: 1,
                              )
                            : const SizedBox(),
                        productAddedToBasketDetails.sellerName != null ||
                                productAddedToBasketDetails.sellerName != ""
                            ? Text(
                                "( ${productAddedToBasketDetails.sellerName.toString()} )",
                                style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s10,
                                )?.copyWith(
                                  height: 2,
                                  overflow: TextOverflow.fade,
                                ),
                                maxLines: 1,
                              )
                            : const SizedBox(),
                        productAddedToBasketDetails.attributeList.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    productAddedToBasketDetails
                                            .attributeList.isNotEmpty
                                        ? Text(
                                            productAddedToBasketDetails
                                                .attributeList[0].value,
                                            style: getRegularStyle(
                                              color: ColorManager.grayForMessage,
                                              fontSize: FontSizeApp.s15,
                                            )!
                                                .copyWith(height: 1),
                                          )
                                        : const SizedBox(),
                                    productAddedToBasketDetails
                                                .attributeList.length >
                                            1
                                        ? Text(
                                            " / ${productAddedToBasketDetails.attributeList[1].value}",
                                            style: getRegularStyle(
                                              color: ColorManager.grayForMessage,
                                              fontSize: FontSizeApp.s15,
                                            )!
                                                .copyWith(height: 1))
                                        : const SizedBox(),
                                  ],
                                ))
                            : const SizedBox(),
                        productAddedToBasketDetails.discountValue != null
                            ? Text(
                                productAddedToBasketDetails.discountValue ?? '',
                                style: getRegularStyle(
                                        color: ColorManager.grayForMessage,
                                        fontSize: FontSizeApp.s12)!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        overflow: TextOverflow.fade,
                                        height: 1),
                                maxLines: 1,
                              )
                            : const SizedBox(),
                        productAddedToBasketDetails.price != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    Formatter.formatPrice(int.tryParse(context
                                            .read<BasketBloc>()
                                            .productPrice(
                                                productAddedToBasketDetails.id ?? 0)
                                            .toString()) ??
                                        0),
                                    style: getBoldStyle(
                                            color: ColorManager.primaryGreen,
                                            fontSize: FontSizeApp.s15)!
                                        .copyWith(
                                      height: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(width: 1),
                                  //todo caruncy
                                  if (productAddedToBasketDetails.price != null)
                                    Text(AppLocalizations.of(context)!.curruncy,
                                        style: getBoldStyle(
                                                color: ColorManager.primaryGreen,
                                                fontSize: FontSizeApp.s10)!
                                            .copyWith(height: 1))
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 19),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 115,
                      width: 115,
                      color: ColorManager.grayForPlaceholder,
                      child: CachedImage(
                        imageUrl: productAddedToBasketDetails.image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: (){
                  context.read<BasketBloc>().add(
                      DeleteProduct(productAddedToBasketDetails.id ?? 0));
                },
                child: const Icon(Icons.clear, color: Colors.red,size: 30,))
          ],
        ),
      ),
    );
  }

  Column buildCounterWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        10.verticalSpace,
        Expanded(
          flex: 3,
          child: InkWell(
            child: Container(
              width: 30.h,
              decoration: BoxDecoration(boxShadow: [
                ColorManager.shadowGaryDown,
              ], color: Colors.white),
              child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: SvgPicture.asset(IconsManager.add)),
            ),
            onTap: () {
              context
                  .read<BasketBloc>()
                  .add(AddCount(productAddedToBasketDetails.id ?? 0));
            },
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 30,
            width: 30,
            child: Center(
                child: Text(
              context
                  .read<BasketBloc>()
                  .countsProducts(productAddedToBasketDetails.id ?? 0)
                  .toString(),
              style: getRegularStyle(color: Colors.black, fontSize: 15.sp),
            )),
          ),
        ),
        Expanded(
          flex: 3,
          child: InkWell(
            child: Container(
              width: 30.h,
              decoration: BoxDecoration(boxShadow: [
                ColorManager.shadowGaryDown,
              ], color: Colors.white),
              child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SvgPicture.asset(IconsManager.remove)),
            ),
            onTap: () {
              if (context
                      .read<BasketBloc>()
                      .countsProducts(productAddedToBasketDetails.id ?? 0) ==
                  1) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmDeleteProductDialog(
                        productAddedToBasketDetails:
                            productAddedToBasketDetails);
                  },
                );
              } else {
                context
                    .read<BasketBloc>()
                    .add(MinusCount(productAddedToBasketDetails.id ?? 0));
              }
            },
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
