import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

import '../../../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../../../bloc/details_order_bloc/details_order_event.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../models/order_details_model.dart';
import '../../../../translations.dart';
import '../../../resources/assets_manager.dart';
import 'delete_product_dialog.dart';

class CardDetailsOrder extends StatelessWidget {
  final OrderDetailsModel product;
  final Function? onTapDelete;
  final Color? cardColor;
  final bool isEdit;
  final bool isDelivered;

  const CardDetailsOrder({
    super.key,
    required this.product,
    this.onTapDelete,
    this.cardColor,
    this.isEdit = false,
    this.isDelivered = false,
  });

  @override
  Widget build(BuildContext context) {
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
            color: cardColor == null
                ? context
                        .read<DetailsOrderBloc>()
                        .returnedProducts
                        .any((e) => e == product.id)
                    ? Colors.red.shade200
                    : Colors.white
                : Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 10,
            ),
            isEdit && !isDelivered
                ? buildCounterWidget(context)
                : !isEdit && isDelivered
                    ? buildReturnButton(context)
                    : Text(
                        "${AppLocalizations.of(context)!.quantity} ${product.quantity}",
                        style: getBoldStyle(
                            color: ColorManager.primaryGreen, fontSize: 16)),
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
                    product.product?.nameOfProduct ?? "",
                    style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSizeApp.s10)
                        ?.copyWith(height: 1),
                  ),
                  SizedBox(
                    height: 25,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: product.product!.attributeList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                product.product!.attributeList[index].value,
                                style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s15,
                                )!
                                    .copyWith(height: 1),
                              ),
                              product.product!.attributeList.length - 1 != index
                                  ? Text(
                                      "/",
                                      style: getRegularStyle(
                                        color: ColorManager.grayForMessage,
                                        fontSize: FontSizeApp.s15,
                                      )!
                                          .copyWith(height: 1),
                                    )
                                  : const SizedBox()
                            ],
                          )),
                    ),
                  ),
                  product.product!.discountStatus == "0"
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(top: 3.h, bottom: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                Formatter.formatPrice(
                                    int.parse(product.product!.price ?? "0")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          Formatter.formatPrice(
                            int.parse(
                              product.product!.discountStatus == "0"
                                  ? product.product!.price ?? "0"
                                  : product.product!.discountPrice ?? "0",
                            ),
                          ),
                          style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s15)!
                              .copyWith(height: 1)),
                      const SizedBox(width: 1),
                      //todo caruncy
                      if (product.price != null)
                        Text(AppLocalizations.of(context)!.curruncy,
                            style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s10)!
                                .copyWith(height: 1))
                    ],
                  ),
                  // if (product.product!.tax != null)
                  //   Text(
                  //       "${AppLocalizations.of(context)!.tax} : ${Formatter.formatPrice(
                  //     (double.parse(product.price!) * product.product!.tax!) *
                  //         product.quantity! /
                  //         100,
                  //   )} ${AppLocalizations.of(context)!.curruncy}")
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
                    imageUrl: product.product?.image ?? "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReturnButton(BuildContext context) {
    return !context
            .read<DetailsOrderBloc>()
            .returnedProducts
            .any((e) => e == product.id)
        ? Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              ColorManager.shadowGaryDown,
            ]),
            child: IconButton(
              onPressed: () {
                context
                    .read<DetailsOrderBloc>()
                    .add(ReturnProduct(product.id ?? 0));
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.red,
                weight: 1000,
                size: 35,
              ),
            ))
        : Container(
            decoration: BoxDecoration(color: Colors.red, boxShadow: [
              ColorManager.shadowGaryDown,
            ]),
            child: IconButton(
              onPressed: () {
                context
                    .read<DetailsOrderBloc>()
                    .add(UnReturnProduct(product.id ?? 0));
              },
              icon: const Icon(
                Icons.rotate_90_degrees_ccw_rounded,
                color: Colors.white,
                weight: 1000,
                size: 35,
              ),
            ));
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
              context.read<DetailsOrderBloc>().add(AddCount(product.id ?? 0));
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
                  .read<DetailsOrderBloc>()
                  .countsProducts(product.id ?? 0)
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
                      .read<DetailsOrderBloc>()
                      .countsProducts(product.id ?? 0) ==
                  1) {
                showDialog(
                  context: context,
                  builder: (BuildContext context1) {
                    return BlocProvider.value(
                        value: BlocProvider.of<DetailsOrderBloc>(context),
                        child: DeleteProductDialog(product: product.product!));
                  },
                );
              } else {
                context
                    .read<DetailsOrderBloc>()
                    .add(MinusCount(product.id ?? 0));
              }
            },
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
