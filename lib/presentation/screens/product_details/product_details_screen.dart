
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import 'package:pharma/presentation/screens/product_details/widgets/about_product_and_amount_section.dart';
import 'package:pharma/presentation/screens/product_details/widgets/product_image.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/presentation/widgets/custom_app_button.dart';
import 'package:pharma/presentation/widgets/custom_loading.dart';
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
      child: const ProductDetailsBody(),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<BasketBloc, BasketState>(
            listener: (context, state) {
              if (state.addToBasketState ==
                  AddToBasketState.successAddedToBasket) {
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
                                      productImage: state
                                                  .productDetailsResponse
                                                  .image !=
                                              null
                                          ? state.productDetailsResponse.image!
                                          : ""),
                                  AboutProductAndAmonutSection(
                                      attributeList: state
                                          .productDetailsResponse
                                          .attributeList,
                                      productDesc: state.productDetailsResponse
                                                  .description !=
                                              null
                                          ? state.productDetailsResponse
                                              .description!
                                          : "",
                                      productName: state.productDetailsResponse
                                                  .nameOfProduct !=
                                              null
                                          ? state.productDetailsResponse
                                              .nameOfProduct!
                                          : ""),
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
                                                  fontSize: FontSizeApp.s15),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
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
                                              height: 115,
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
                                                            8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        AppRouter.pushReplacement(
                                                            context,
                                                            ProductDetailsScreen(
                                                                id: state
                                                                    .productDetailsResponse
                                                                    .relatedProducts![
                                                                        index]
                                                                    .id));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: ColorManager
                                                                    .grayForPlaceholder,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xff0000002E),
                                                                offset: Offset(
                                                                    0, 2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                            ]),
                                                        height: 115,
                                                        width: 115,
                                                        child: CachedImage(
                                                            imageUrl: state
                                                                .productDetailsResponse
                                                                .relatedProducts![
                                                                    index]
                                                                .image),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
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
                                              height: 115,
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
                                                            8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        AppRouter.pushReplacement(
                                                            context,
                                                            ProductDetailsScreen(
                                                                id: state
                                                                    .productDetailsResponse
                                                                    .similarProducts![
                                                                        index]
                                                                    .id));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: ColorManager
                                                                    .grayForPlaceholder,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xff0000002e),
                                                                offset: Offset(
                                                                    0, 2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                            ]),
                                                        height: 115,
                                                        width: 115,
                                                        child: CachedImage(
                                                            imageUrl: state
                                                                .productDetailsResponse
                                                                .similarProducts![
                                                                    index]
                                                                .image),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : const SizedBox(),
                                      CustomAppButton(
                                        ontap: () {
                                         if(sl<AuthenticationBloc>().loggedIn) {
                                           context.read<BasketBloc>().add(AddToBasket(
                                              product:
                                              ProductDetailsResponse(
                                                image: state.productDetailsResponse.image??"",
                                                price: state
                                                    .productDetailsResponse
                                                    .price ==
                                                    null
                                                    ? ""
                                                    : state
                                                    .productDetailsResponse
                                                    .price!,
                                                  nameOfProduct: state
                                                              .productDetailsResponse
                                                              .nameOfProduct ==
                                                          null
                                                      ? ""
                                                      : state
                                                          .productDetailsResponse
                                                          .nameOfProduct!,
                                                  sellerName:
                                                      state.productDetailsResponse.sellerName == null
                                                          ? ""
                                                          : state
                                                              .productDetailsResponse
                                                              .sellerName!,
                                                  isDiscount: state
                                                              .productDetailsResponse
                                                              .discountValue ==
                                                          "0"
                                                      ? false || state.productDetailsResponse.discountValue != null
                                                      : true,
                                                  attributeList: state.productDetailsResponse.attributeList,
                                                  id: state.productDetailsResponse.id!,
                                                  quantity: state.quntity,
                                              discountValue: state.productDetailsResponse.discountValue)
                                           ));
                                         }
                                         else{
                                           ErrorDialog.openDialog(context,AppLocalizations.of(context)!.no_add_basket);
                                         }
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
}
