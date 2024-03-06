import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';
import '../../../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../../../bloc/favorite_bloc/favorite_state.dart';
import '../../../../core/app_router/app_router.dart';

class BodyFavorite extends StatelessWidget {
  const BodyFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return context.read<FavoriteBloc>().favoriteListProducts.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount:
                    context.read<FavoriteBloc>().favoriteListProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 26,
                    mainAxisExtent: 230),
                itemBuilder: (context, index) {
                  return Center(
                      child: GestureDetector(
                          onTap: () {
                            AppRouter.push(
                              context,
                              ProductDetailsScreen(
                                id: context
                                        .read<FavoriteBloc>()
                                        .favoriteListProducts[index]
                                        .id ??
                                    0,
                              ),
                            );
                          },
                          child: CustomProductCard(
                            productInfo: context
                                .read<FavoriteBloc>()
                                .favoriteListProducts[index],
                          )));
                },
              )
            : CustomNoData(
                noDataStatment:
                    AppLocalizations.of(context)!.no_favorite_items);
      },
    );
  }
}
