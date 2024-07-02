import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';

import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/home_section_products.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

import '../../../../bloc/basket_bloc/basket_bloc.dart';
import '../../../../models/product_response.dart';
import '../../../resources/style_app.dart';

class HomeSection extends StatefulWidget {
  final int sectionId;
  final Map<String, dynamic> title;
  final List<ProductResponse> list;

  const HomeSection({
    Key? key,
    required this.sectionId,
    required this.list,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String appLang = DataStore.instance.lang;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppValueConst.homeVerticalPadding,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 0),
            child: CustomSectionName(
              sectionName: widget.title[appLang] ??
                  AppLocalizations.of(context)!.suggested_products,
              onTap: () {
                AppRouter.push(
                  context,
                  HomeSectionProducts(
                    sectionId: widget.sectionId,
                    sectionName: widget.title[appLang],
                  ),
                );
              },
            ),
          ),
          BlocConsumer<BasketBloc, BasketState>(
              listener: (context, state) {},
              builder: (context, state) {
                return SizedBox(
                  height: 260.h,
                  width: 1.sw,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    itemCount: widget.list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          if (!context.read<BasketBloc>().mutableProducts.any(
                              (element) =>
                                  element.id == widget.list[index].id)) {
                            context
                                .read<BasketBloc>()
                                .add(AddToBasket(product: [
                                  ProductResponse(
                                    quantity: 1,
                                    image: widget.list[index].image,
                                    id: widget.list[index].id,
                                    discountPrice:
                                        widget.list[index].discountPrice,
                                    discountStatus:
                                        widget.list[index].discountStatus,
                                    availabilityOfProduct: widget
                                        .list[index].availabilityOfProduct,
                                    nameOfProduct:
                                        widget.list[index].nameOfProduct,
                                    price: widget.list[index].price,
                                    sellerName: widget.list[index].sellerName,
                                    attributeList:
                                        widget.list[index].attributeList,
                                  )
                                ]));
                            print(widget.list[index].attributeList.toString() +
                                "#@");
                          }
                        },
                        onDoubleTap: () {
                          if (!context.read<BasketBloc>().mutableProducts.any(
                              (element) =>
                                  element.id == widget.list[index].id)) {
                            context
                                .read<BasketBloc>()
                                .add(AddToBasket(product: [
                                  ProductResponse(
                                    quantity: 1,
                                    image: widget.list[index].image,
                                    id: widget.list[index].id,
                                    discountPrice:
                                        widget.list[index].discountPrice,
                                    discountStatus:
                                        widget.list[index].discountStatus,
                                    availabilityOfProduct: widget
                                        .list[index].availabilityOfProduct,
                                    nameOfProduct:
                                        widget.list[index].nameOfProduct,
                                    price: widget.list[index].price,
                                    sellerName: widget.list[index].sellerName,
                                    attributeList:
                                        widget.list[index].attributeList,
                                  )
                                ]));
                          }
                        },
                        onTap: () {
                          AppRouter.push(
                            context,
                            ProductDetailsScreen(
                              id: widget.list[index].id,
                              //quantity: widget.list[index].quantity ?? 0,
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 0, start: index == 0 ? 0 : 15),
                          child: Stack(
                            children: [
                              CustomProductCard(
                                productInfo: widget.list[index],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<BasketBloc>().add(AddCount(
                                          widget.list[index].id,
                                          ProductResponse(
                                            quantity: 1,
                                            image: widget.list[index].image,
                                            id: widget.list[index].id,
                                            discountPrice: widget
                                                .list[index].discountPrice,
                                            discountStatus: widget
                                                .list[index].discountStatus,
                                            availabilityOfProduct: widget
                                                .list[index]
                                                .availabilityOfProduct,
                                            nameOfProduct: widget
                                                .list[index].nameOfProduct,
                                            price: widget.list[index].price,
                                            sellerName:
                                                widget.list[index].sellerName,
                                            attributeList: widget
                                                .list[index].attributeList,
                                          )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          color: Colors.green,
                                          width: 22,
                                          height: 22,
                                          child: Center(
                                              child: Text(
                                            context
                                                    .read<BasketBloc>()
                                                    .mutableProducts
                                                    .any((element) =>
                                                        element.id ==
                                                        widget.list[index].id)
                                                ? context
                                                    .read<BasketBloc>()
                                                    .mutableProducts
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        widget.list[index].id)
                                                    .quantity
                                                    .toString()
                                                : "+",
                                            style: getBoldStyle(
                                              color: Colors.white,
                                            ),
                                          ))),
                                    ),
                                  ),
                                  if (context
                                      .read<BasketBloc>()
                                      .mutableProducts
                                      .any((element) =>
                                          element.id == widget.list[index].id))
                                    GestureDetector(
                                      onTap: () {
                                        if (context
                                            .read<BasketBloc>()
                                            .mutableProducts
                                            .any((element) =>
                                                element.id ==
                                                widget.list[index].id)) {
                                          if (context
                                                  .read<BasketBloc>()
                                                  .mutableProducts
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      widget.list[index].id)
                                                  .quantity !=
                                              1) {
                                            context.read<BasketBloc>().add(
                                                MinusCount(
                                                    widget.list[index].id));
                                          } else {
                                            context.read<BasketBloc>().add(
                                                DeleteProduct(
                                                    widget.list[index].id));
                                          }
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: Colors.red,
                                          width: 22,
                                          height: 22,
                                          child: const Icon(Icons.remove,
                                              color: Colors.white, size: 20),
                                        ),
                                      ),
                                    ),
                                ],
                              )
                              // : SizedBox()
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
