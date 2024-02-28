import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/about_product_and_amount_section.dart';
import 'package:pharma/presentation/screens/product_details/widgets/counter_box.dart';
import 'package:pharma/presentation/screens/product_details/widgets/product_image.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/presentation/widgets/custom_app_button.dart';
import 'package:pharma/presentation/widgets/custom_loading.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../resources/font_app.dart';
import '../../widgets/dialogs/error_dialog.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int? id;

  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProductdetailsBloc>()..add(GetProductDetailsById(id: id!)),
      child:  ProductDetailsBody(),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
   ProductDetailsBody({super.key});
  final List<ProductDetailsResponse> tempProductList  = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<BasketBloc, BasketState>(
            listener: (context, state) {
              if (state.addToBasketState ==
                  AddToBasketState.successAddedToBasket) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Container(

                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.added_to_basket,
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSizeApp.s14),
                          )),
                      backgroundColor: ColorManager.primaryGreen,
                    )
                //     SnackBar(
                //     content:
                //         Text('${AppLocalizations.of(context)!.added_to_basket}',
                //         style: AppS,),
                // duration:  Duration(seconds: 2),
                //   backgroundColor: ColorManager.primaryGreen,
                //   width: 200,
                // )
                );
                AppRouter.pop(context);
              }
            },
          )
        ],
        child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: [
                  state.screenState == ScreenState.loading
                      ? const CustomLoading()
                      : state.screenState == ScreenState.success
                          ? Expanded(
                              child: ListView(
                                children: [
                                  ProductImage(
                                      productImage: state.productDetailsResponse
                                                  .image !=
                                              null
                                          ? state.productDetailsResponse.image!
                                          : ""),
                                  AboutProductAndAmonutSection(
                                    productId: state
                                        .productDetailsResponse.id??0 ,
                                    attributeList: state
                                        .productDetailsResponse.attributeList,
                                    productDesc: state.productDetailsResponse
                                                .description !=
                                            null
                                        ? state
                                            .productDetailsResponse.description!
                                        : "",
                                    productName: state.productDetailsResponse
                                                .nameOfProduct !=
                                            null
                                        ? state.productDetailsResponse
                                            .nameOfProduct!
                                        : "",
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 45),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .price,
                                              style: getBoldStyle(
                                                color:
                                                    ColorManager.primaryGreen,
                                                fontSize: FontSizeApp.s15,
                                              ),
                                            ),
                                            state.productDetailsResponse
                                                        .price !=
                                                    null
                                                ? Text(
                                                    "${Formatter.formatPrice(int.tryParse(state.productDetailsResponse.price!)!)} ${AppLocalizations.of(context)!.curruncy}",
                                                    style: getBoldStyle(
                                                        color: ColorManager
                                                            .primaryGreen,
                                                        fontSize:
                                                            FontSizeApp.s15),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                      state.productDetailsResponse
                                              .relatedProducts!.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                25.w,
                                                20.h,
                                                10.w,
                                                0,
                                              ),
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .related_products,
                                                style: getBoldStyle(
                                                    color: ColorManager.black,
                                                    fontSize: FontSizeApp.s15),
                                              ),
                                            )
                                          : const SizedBox(),
                                      state.productDetailsResponse
                                              .relatedProducts!.isNotEmpty
                                          ? SizedBox(
                                              height: 260.h,
                                              width: 1.sw,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: state
                                                    .productDetailsResponse
                                                    .relatedProducts!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        AppRouter
                                                            .pushReplacement(
                                                          context,
                                                          ProductDetailsScreen(
                                                            id: state
                                                                .productDetailsResponse
                                                                .relatedProducts![
                                                                    index]
                                                                .id,
                                                          ),
                                                        );
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          CustomProductCard(


                                                            productInfo: state
                                                                .productDetailsResponse
                                                                .relatedProducts![index],
                                                          ),
                                                          customAmount(
                                                            quantityString: state
                                                                .quantityRelated
                                                                .toString(),
                                                            addEvent:
                                                                AddQuantityRelatedToOrder(
                                                              context
                                                                  .read<
                                                                      ProductdetailsBloc>()
                                                                  .state
                                                                  .quantityRelated!,
                                                            ),
                                                            removeEvent:
                                                                RemoveQuantityRelatedToOrder(
                                                              context
                                                                  .read<
                                                                      ProductdetailsBloc>()
                                                                  .state
                                                                  .quantityRelated!,
                                                            ),
                                                            context: context,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : const SizedBox(),
                                      state.productDetailsResponse
                                              .similarProducts!.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                25.w,
                                                20.h,
                                                10.w,
                                                0,
                                              ),
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .similar_products,
                                                style: getBoldStyle(
                                                    color: ColorManager.black,
                                                    fontSize: FontSizeApp.s15),
                                              ),
                                            )
                                          : const SizedBox(),
                                      state.productDetailsResponse
                                              .similarProducts!.isNotEmpty
                                          ? SizedBox(
                                              height: 260.h,
                                              width: 1.sw,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: state
                                                    .productDetailsResponse
                                                    .similarProducts!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            AppRouter
                                                                .pushReplacement(
                                                              context,
                                                              ProductDetailsScreen(
                                                                id: state
                                                                    .productDetailsResponse
                                                                    .similarProducts![
                                                                        index]
                                                                    .id,
                                                              ),
                                                            );
                                                          },
                                                          child:
                                                              CustomProductCard(

                                                            productInfo: state
                                                                .productDetailsResponse
                                                                .similarProducts![index],
                                                          ),
                                                        ),
                                                        customAmount(
                                                          quantityString: state
                                                              .quantitySimilar
                                                              .toString(),
                                                          addEvent:
                                                              AddQuantitySimilarToOrder(
                                                            context
                                                                .read<
                                                                    ProductdetailsBloc>()
                                                                .state
                                                                .quantitySimilar!,
                                                          ),
                                                          removeEvent:
                                                              RemoveQuantitySimilarToOrder(
                                                            context
                                                                .read<
                                                                    ProductdetailsBloc>()
                                                                .state
                                                                .quantitySimilar!,
                                                          ),
                                                          context: context,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : const SizedBox(),
                                      CustomAppButton(
                                        ontap: () {
                                          if (sl<AuthenticationBloc>()
                                              .loggedIn) {
                                            context.read<BasketBloc>().add(
                                                  buildAddToBasket(state),
                                                );
                                          } else {
                                            ErrorDialog.openDialog(
                                              context,
                                              AppLocalizations.of(context)!
                                                  .no_add_basket,
                                            );
                                          }
                                          tempProductList.clear();
                                        },
                                        myText: AppLocalizations.of(context)!
                                            .add_to_basket,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 74, vertical: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AddToBasket buildAddToBasket(ProductdetailsState state) {
    print('=========================================');
    print("ProductRelated : ${state.productDetailsResponse.id}");
    print('=========================================');
    print("Product : ${state.quantityRelated}");
    print('=========================================');
    print("Product :  ${state.productDetailsResponse.similarProducts![0].id}");
    print("Product :  ${state.quantitySimilar}");
    print('=========================================');
    return AddToBasket(
      product: [
        ProductDetailsResponse(
          image: state.productDetailsResponse.image ?? "",
          price: state.productDetailsResponse.price == null
              ? ""
              : state.productDetailsResponse.price!,
          nameOfProduct: state.productDetailsResponse.nameOfProduct == null
              ? ""
              : state.productDetailsResponse.nameOfProduct!,
          sellerName: state.productDetailsResponse.sellerName == null
              ? ""
              : state.productDetailsResponse.sellerName!,
          isDiscount: state.productDetailsResponse.discountValue == "0"
              ? false || state.productDetailsResponse.discountValue != null
              : true,
          attributeList: state.productDetailsResponse.attributeList,
          id: state.productDetailsResponse.id!,
          quantity: state.quntity,
          discountValue: state.productDetailsResponse.discountValue,
        ),
        ProductDetailsResponse(
          image: state.productDetailsResponse.similarProducts![0].image ?? "",
          price: state.productDetailsResponse.similarProducts![0].price == null
              ? ""
              : state.productDetailsResponse.similarProducts![0].price!,
          nameOfProduct: state.productDetailsResponse.similarProducts![0]
                      .nameOfProduct ==
                  null
              ? ""
              : state.productDetailsResponse.similarProducts![0].nameOfProduct!,
          sellerName: state
                      .productDetailsResponse.similarProducts![0].sellerName ==
                  null
              ? ""
              : state.productDetailsResponse.similarProducts![0].sellerName!,
          id: state.productDetailsResponse.similarProducts![0].id!,
          quantity: state.quantityRelated,
          discountValue:
              state.productDetailsResponse.similarProducts![0].discountValue,
        ),
      ],
    );
  }

  Widget customAmount({
    required BuildContext context,
    required ProductdetailsEvent addEvent,
    required ProductdetailsEvent removeEvent,
    required String quantityString,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        right: Directionality.of(context) == TextDirection.rtl ? 22 : 0,
        left: Directionality.of(context) == TextDirection.ltr ? 22 : 0,
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              height: 25,
              width: 30,
              child: CustomCountWidget(
                height: 25,
                width: 30,
                myIcon: Icons.add,
                onTap: () {
                  context.read<ProductdetailsBloc>().add(addEvent);
                },
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            InnerShadow(
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(
                    0.25,
                  ),
                  blurRadius: 10,
                  offset: const Offset(
                    2,
                    5,
                  ),
                )
              ],
              child: Container(
                height: 25,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        quantityString,
                        style: getUnderBoldStyle(
                          color: ColorManager.primaryGreen,
                          fontSize: FontSizeApp.s20,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              height: 25,
              width: 30,
              child: CustomCountWidget(
                height: 25,
                width: 30,
                myIcon: Icons.remove,
                onTap: () {
                  context.read<ProductdetailsBloc>().add(removeEvent);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
