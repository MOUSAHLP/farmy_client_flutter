import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../translations.dart';
import '../../../widgets/custom_button.dart';

class CardBasket extends StatelessWidget {
  final ProductDetailsResponse productAddedToBasketDetails;
  const CardBasket({super.key, required this.productAddedToBasketDetails});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) =>  Padding(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(

                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(boxShadow: [
                          ColorManager.shadowGaryDown,
                        ], color: Colors.white),
                        child:
                            const Icon(Icons.add, color: ColorManager.primaryGreen),
                      ),
                      onTap: (){
                        context.read<BasketBloc>().add(
                            AddCount(
                                productAddedToBasketDetails.id?? 0));
                      },
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child:
                           Center(child: Text(context.read<BasketBloc>().countsProducts(productAddedToBasketDetails.id??0).toString(),style: getRegularStyle(color: Colors.black),)),
                    ),
                    InkWell(
                      onTap: (){
                        if(context.read<BasketBloc>().countsProducts(productAddedToBasketDetails.id??0)==1){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(25.0),
                                  ),
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                           AppLocalizations.of(context)!.delete_product,
                                            style: getBoldStyle(
                                                color: ColorManager
                                                    .grayForMessage,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                label:
                                                AppLocalizations.of(
                                                    context)!
                                                    .confirm,
                                                fillColor: ColorManager
                                                    .primaryGreen,
                                                onTap: () {
                                                  context.read<BasketBloc>().add(
                                                      DeleteProduct(
                                                          productAddedToBasketDetails.id?? 0));
                                                  AppRouter.pop(
                                                      context);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 28,
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                label:
                                                AppLocalizations.of(
                                                    context)!
                                                    .back,
                                                fillColor: Colors.white,
                                                onTap: () {
                                                  AppRouter.pop(
                                                      context);
                                                },
                                                isFilled: true,
                                                labelColor: ColorManager
                                                    .primaryGreen,
                                                borderColor: ColorManager
                                                    .primaryGreen,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                        }else {
                          context.read<BasketBloc>().add(
                            MinusCount(
                                productAddedToBasketDetails.id?? 0));
                        }
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(boxShadow: [
                          ColorManager.shadowGaryDown,
                        ], color: Colors.white),
                        child: const Icon(Icons.remove, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    productAddedToBasketDetails.nameOfProduct??"",
                    style: getBoldStyle(
                            color: ColorManager.black, fontSize: FontSizeApp.s10)
                        ?.copyWith(height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        productAddedToBasketDetails.attributeList.isNotEmpty
                            ? Text(productAddedToBasketDetails.attributeList[0].value,
                            style: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15,
                            ))
                            : const SizedBox(),
                        productAddedToBasketDetails.attributeList.length > 1
                            ? Text(" / ${productAddedToBasketDetails.attributeList[1].value}",
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
                                int.tryParse(context.read<BasketBloc>().productPrice(productAddedToBasketDetails.id??0).toString())??0),
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
                  width: 115,
                  color: ColorManager.grayForPlaceholde,
                  child:  CachedImage(
                    imageUrl:productAddedToBasketDetails.image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
