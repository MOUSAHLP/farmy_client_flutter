import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_state.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

import '../../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../../models/product_response.dart';
import '../../../../translations.dart';
import '../../../resources/assets_manager.dart';

class CardDetailsOrderNotInstall extends StatelessWidget {
  final ProductResponse product;
  final MyOrderBloc myOrderBloc;
  final Function? onTapDelete;
  final Color? cardColor;
  final bool isEdit;
  final int idBasket;
  final int index;

  const CardDetailsOrderNotInstall({
    super.key,
    required this.product,
    this.onTapDelete,
    this.cardColor,
    this.isEdit = false,
    required this.idBasket,
    required this.index,
    required this.myOrderBloc,
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
            color: cardColor ?? Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 10,
            ),
            isEdit
                ? buildCounterWidget(context, myOrderBloc)
                : const SizedBox(),
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
                    product.nameOfProduct ?? "",
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
                      itemCount: product.attributeList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              product.attributeList[index].value,
                              style: getRegularStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15,
                              )!
                                  .copyWith(height: 1),
                            ),
                            product.attributeList.length - 1 != index
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
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(product.discountPrice ?? "",
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
                    imageUrl: product.image ?? "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCounterWidget(BuildContext context, MyOrderBloc myOrderBloc) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      bloc: myOrderBloc,
      builder: (context, state) => Column(
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
                context.read<MyOrderBloc>().add(AddCountOrder(product.id ?? 0));
              },
            ),
          ),

          /// TODO
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: Text(

                  myOrderBloc.state.quantityInBasket[index].quantity.toString(),
                  style: getRegularStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ),
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
                context.read<MyOrderBloc>().add(MinusCountOrder(product.id ?? 0));
              },
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
