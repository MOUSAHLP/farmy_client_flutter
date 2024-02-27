import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';

import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/favorite/widgets/build_shimmer_favorites.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../base_screen/base_screen.dart';

class AllFavoritesScreen extends StatelessWidget {
  const AllFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        sl<FavoriteBloc>()
          ..add(const GetFavorites()),
        child: const FavoriteScreen());
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseScreenScaffold(
          appbarTitle: AppLocalizations.of(context)!.favorite,
          isComeBack: false,
          body: !sl<AuthenticationBloc>().loggedIn
              ? Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
                    if(state.screenState==ScreenState.loading) {
                      return const BuildShimmerFavorites();
                    } else if(state.screenState==ScreenState.error) {
                        return
                          CustomErrorScreen(
                          onTap: (){},
                          titleError: state.error,
                        );
                      } else if(state.screenState==ScreenState.success) {
                        return buildGridView(state);
                      } else {
                        return const SizedBox();
                      }
                    },
          ),
                  ),
                ],
              )
              : const Expanded(child: GuestScreen()),
        );

  }

  GridView buildGridView(FavoriteState state) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount:state.favoritesList.length ,
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
                  productInfo: ProductsBySubCategoryIdResponse.init(),
                )));
      },
    );
  }
}
