import 'package:flutter/material.dart';
import 'package:pharma/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';
import '../../../../core/app_router/app_router.dart';
class BodyFavorite extends StatelessWidget {
  const BodyFavorite({
    super.key,
    required this.state,
  });

  final FavoriteState state;

  @override
  Widget build(BuildContext context) {
    return  state.favoritesList.isNotEmpty?GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: state.favoritesList.length ,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 26,
          mainAxisExtent: 226),
      itemBuilder: (context, index) {
        return Center(
            child: GestureDetector(
                onTap: () {
                  AppRouter.push(
                      context,
                      const ProductDetailsScreen(
                        id: 1,
                      ));
                },
                child: CustomProductCard(
                  productInfo:state.favoritesList[index],
                )));
      },
    ):
     CustomNoData(noDataStatment: AppLocalizations.of(context)!.no_favorite_items);
  }
}