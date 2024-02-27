import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/favorite/widgets/body_favorite.dart';
import 'package:pharma/presentation/screens/favorite/widgets/build_shimmer_favorites.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
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
                        return BodyFavorite(state: state);
                        //   CustomErrorScreen(
                        //   onTap: (){},
                        //   titleError: state.error,
                        // );
                      } else if(state.screenState==ScreenState.success) {
                        return BodyFavorite(state: state);
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

}


