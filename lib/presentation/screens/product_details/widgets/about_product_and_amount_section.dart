import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/counter_box.dart';

import '../../../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../../../bloc/favorite_bloc/favorite_event.dart';
import '../../../../bloc/favorite_bloc/favorite_state.dart';
import '../../../../models/product_response.dart';
import '../../../widgets/favorite_heart.dart';
import 'card_attributes.dart';

class AboutProductAndAmountSection extends StatelessWidget {
  final int quantity;
 final ProductResponse productDetails;
  const AboutProductAndAmountSection({
    super.key,
    required this.quantity,
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails.nameOfProduct??"",
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeApp.s15,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
                                productDetails.sellerName!=null?  Text(
                                  "(${productDetails.sellerName})",
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s10,
                                  )!
                                      .copyWith(
                                    height: 1,
                                  ),
                                ):SizedBox(),
                                const SizedBox(
                                  height: 3,
                                ),

                                const SizedBox(
                                  height: 4,
                                ),
                                HtmlWidget(
                                  productDetails.description??"",
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              return FavoriteHeart(
                                id: productDetails.id,
                                isToggled: productDetails.isFavorite,
                                onTap: () {
                                  context.read<FavoriteBloc>().add(
                                        ChangeFavoriteStatusProduct(
                                            productDetails.id,
                                        productDetails),
                                      );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CardAttributes(productDetails: productDetails),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCountWidget(
                width: 38,
                height: 38,
                myIcon: Icons.add,
                onTap: () {
                  if (state.quntity! < quantity) {
                    context.read<ProductdetailsBloc>().add(
                          AddQuntityToOrder(
                            context.read<ProductdetailsBloc>().state.quntity!,
                          ),
                        );
                  }
                },
              ),
              const SizedBox(
                width: 18,
              ),
              InnerShadow(
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(2, 5),
                  )
                ],
                child: Container(
                  height: 38,
                  width: 84,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      state.quntity.toString(),
                      style: getUnderBoldStyle(
                        color: ColorManager.primaryGreen,
                        fontSize: FontSizeApp.s24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              CustomCountWidget(
                width: 38,
                height: 38,
                myIcon: Icons.remove,
                onTap: () {
                  if (state.quntity! >= 0) {
                    context.read<ProductdetailsBloc>().add(
                          RemoveQuntityToOrder(
                            context.read<ProductdetailsBloc>().state.quntity!,
                          ),
                        );
                  }
                },
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}


