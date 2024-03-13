import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/models/product_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/product_details/widgets/about_product_and_amount_section.dart';
import 'package:pharma/presentation/screens/product_details/widgets/custom_amount.dart';
import 'package:pharma/presentation/screens/product_details/widgets/product_image.dart';
import 'package:pharma/presentation/widgets/custom_app_button.dart';
import 'package:pharma/presentation/widgets/custom_loading.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/translations.dart';

import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_error_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int? id;
  final int? quantity;

  const ProductDetailsScreen({
    super.key,
    required this.id,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductdetailsBloc>()
        ..add(
          GetProductDetailsById(id: id!),
        ),
      child: ProductDetailsBody(
        quantity: quantity,
      ),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
  final int? quantity;

  const ProductDetailsBody({super.key, this.quantity});

  @override
  Widget build(BuildContext context) {
    bool isAttribution = false;

    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<BasketBloc, BasketState>(
            listener: (context, state) {
              if (state.addToBasketState ==
                  AddToBasketState.successAddedToBasket) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     duration: const Duration(seconds: 1),
                //     content: Container(
                //       alignment: Alignment.center,
                //       child: Text(
                //         AppLocalizations.of(context)!.added_to_basket,
                //         style: getRegularStyle(
                //           color: ColorManager.white,
                //           fontSize: FontSizeApp.s14,
                //         ),
                //       ),
                //     ),
                //     backgroundColor: ColorManager.primaryGreen,
                //   ),
                // );
                AppRouter.pushReplacement(
                  context,
                  const HomeScreen(),
                );
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
                                      productImage:
                                          state.productDetailsResponse.image ??
                                              ""),
                                  AboutProductAndAmountSection(
                                    productDetails:
                                        state.productDetailsResponse,
                                    quantity: quantity ?? 0,
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 45,
                                        ),
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
                                                      fontSize: FontSizeApp.s15,
                                                    ),
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
                                                  fontSize: FontSizeApp.s15,
                                                ),
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
                                                  var targetId = state
                                                      .productDetailsResponse
                                                      .relatedProducts![index]
                                                      .id;
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
                                                            quantity: state
                                                                .productDetailsResponse
                                                                .relatedProducts![
                                                                    index]
                                                                .quantity,
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
                                                          CustomAmount(
                                                            quantityString: state
                                                                        .listRelatedProduct ==
                                                                    null
                                                                ? 0.toString()
                                                                : state.listRelatedProduct!
                                                                        .any(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        targetId,
                                                                  )
                                                                    ? state
                                                                        .listRelatedProduct!
                                                                        .firstWhere(
                                                                          (element) =>
                                                                              element.id ==
                                                                              targetId,
                                                                        )
                                                                        .quantity
                                                                        .toString()
                                                                    : 0.toString(),
                                                            addEvent:
                                                                AddQuantityRelatedToOrder(
                                                              state.productDetailsResponse
                                                                      .relatedProducts![
                                                                  index],
                                                              index,
                                                            ),
                                                            removeEvent:
                                                                RemoveQuantityRelatedToOrder(
                                                              state.productDetailsResponse
                                                                      .relatedProducts![
                                                                  index],
                                                            ),
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
                                                  fontSize: FontSizeApp.s15,
                                                ),
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
                                                  var targetId = state
                                                      .productDetailsResponse
                                                      .similarProducts![index]
                                                      .id;
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
                                                                quantity: state
                                                                    .productDetailsResponse
                                                                    .similarProducts![
                                                                        index]
                                                                    .quantity,
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
                                                        CustomAmount(
                                                          quantityString: state
                                                                      .listSimilarProduct ==
                                                                  null
                                                              ? 0.toString()
                                                              : state.listSimilarProduct!
                                                                      .any(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      targetId,
                                                                )
                                                                  ? state
                                                                      .listSimilarProduct!
                                                                      .firstWhere(
                                                                        (element) =>
                                                                            element.id ==
                                                                            targetId,
                                                                      )
                                                                      .quantity
                                                                      .toString()
                                                                  : 0.toString(),
                                                          addEvent:
                                                              AddQuantitySimilarToOrder(
                                                            state.productDetailsResponse
                                                                    .similarProducts![
                                                                index],
                                                            index,
                                                          ),
                                                          removeEvent:
                                                              RemoveQuantitySimilarToOrder(
                                                            state.productDetailsResponse
                                                                    .similarProducts![
                                                                index],
                                                          ),
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
                                            context
                                                .read<BasketBloc>()
                                                .add(buildAddToBasket(state));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .added_to_basket,
                                                    style: getRegularStyle(
                                                      color: ColorManager.white,
                                                      fontSize: FontSizeApp.s14,
                                                    ),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    ColorManager.primaryGreen,
                                              ),
                                            );
                                          } else {
                                            ErrorDialog.openDialog(
                                              context,
                                              AppLocalizations.of(context)!
                                                  .no_add_basket,
                                            );
                                          }
                                        },
                                        myText: AppLocalizations.of(context)!
                                            .add_to_basket,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 74,
                                          vertical: 10,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : state.screenState == ScreenState.error
                              ? Column(
                                  children: [
                                    const CustomAppBarScreen(
                                        sectionName: "", isComeBack: true),
                                    Center(
                                        child: CustomErrorScreen(
                                      onTap: () {},
                                    )),
                                  ],
                                )
                              : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AddToBasket buildAddToBasket(ProductdetailsState state) {
    List<ProductResponse> A = [];
    if (state.listSimilarProduct != null) {
      for (var tmp in state.listSimilarProduct!) {
        A.add(
          ProductResponse(
            quantity: tmp.quantity,
            image: tmp.image,
            id: tmp.id ?? 0,
            discountValue: tmp.discountValue,
            discountStatus: tmp.discountStatus,
            availabilityOfProduct: tmp.availabilityOfProduct,
            nameOfProduct: tmp.nameOfProduct,
            price: tmp.price,
            sellerName: tmp.sellerName,
          ),
        );
      }
    }
    if (state.listRelatedProduct != null) {
      for (var tmp in state.listRelatedProduct!) {
        A.add(
          ProductResponse(
            quantity: tmp.quantity,
            image: tmp.image,
            id: tmp.id ?? 0,
            discountValue: tmp.discountValue,
            discountStatus: tmp.discountStatus,
            availabilityOfProduct: tmp.availabilityOfProduct,
            nameOfProduct: tmp.nameOfProduct,
            price: tmp.price,
            sellerName: tmp.sellerName,
          ),
        );
      }
    }
    A.add(
      ProductResponse(
        similarProducts: state.productDetailsResponse.similarProducts,
        sellerName: state.productDetailsResponse.sellerName,
        relatedProducts: state.productDetailsResponse.relatedProducts,
        price: state.productDetailsResponse.price,
        nameOfProduct: state.productDetailsResponse.nameOfProduct,
        isDiscount: state.productDetailsResponse.isDiscount,
        availabilityOfProduct:
            state.productDetailsResponse.availabilityOfProduct,
        attributeList: state.productDetailsResponse.attributeList,
        description: state.productDetailsResponse.description,
        discountValue: state.productDetailsResponse.discountValue,
        id: state.productDetailsResponse.id,
        image: state.productDetailsResponse.image,
        quantity: state.quntity,
        discountStatus: state.productDetailsResponse.discountStatus,
      ),
    );
    return AddToBasket(
      product: A,
    );
  }

// Widget customAmount({
//   required BuildContext context,
//   required ProductdetailsEvent addEvent,
//   required ProductdetailsEvent removeEvent,
//   required String quantityString,
// }) {
//   return Padding(
//     padding: EdgeInsets.only(
//       right: Directionality.of(context) == TextDirection.rtl ? 22 : 0,
//       left: Directionality.of(context) == TextDirection.ltr ? 22 : 0,
//     ),
//     child: Center(
//       child: Row(
//         children: [
//           SizedBox(
//             height: 25,
//             width: 30,
//             child: CustomCountWidget(
//               height: 25,
//               width: 30,
//               myIcon: Icons.add,
//               onTap: () {
//                 context.read<ProductdetailsBloc>().add(addEvent);
//               },
//             ),
//           ),
//           const SizedBox(
//             width: 9,
//           ),
//           InnerShadow(
//             shadows: [
//               Shadow(
//                 color: Colors.black.withOpacity(
//                   0.25,
//                 ),
//                 blurRadius: 10,
//                 offset: const Offset(
//                   2,
//                   5,
//                 ),
//               )
//             ],
//             child: Container(
//               height: 25,
//               width: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 color: Colors.white,
//               ),
//               child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
//                 builder: (context, state) {
//                   return Center(
//                     child: Text(
//                       quantityString,
//                       style: getUnderBoldStyle(
//                         color: ColorManager.primaryGreen,
//                         fontSize: FontSizeApp.s20,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 9,
//           ),
//           SizedBox(
//             height: 25,
//             width: 30,
//             child: CustomCountWidget(
//               height: 25,
//               width: 30,
//               myIcon: Icons.remove,
//               onTap: () {
//                 context.read<ProductdetailsBloc>().add(removeEvent);
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
