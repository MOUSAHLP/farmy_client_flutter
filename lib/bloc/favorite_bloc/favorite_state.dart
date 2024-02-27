part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final ScreenState screenState;
  final bool? isFavorite;
  final String error;

  /// todo edit ProductsBySubCategoryIdResponse
  List<ProductsBySubCategoryIdResponse> favoritesList = [];

  FavoriteState(
      {this.screenState=ScreenState.initialized,
      this.isFavorite = false,
      this.favoritesList = const [],
      this.error = ''});

  FavoriteState copyWith(
      {bool? isFavorite,
      ScreenState? screenState,
      List<ProductsBySubCategoryIdResponse>? favoritesList,
         String? error

      }) {
    return FavoriteState(
      isFavorite: isFavorite ?? isFavorite,
      favoritesList: favoritesList ?? this.favoritesList,
      screenState: screenState ?? this.screenState,
        error: error??''
    );
  }
  @override
  List<Object?> get props =>
      [identityHashCode(this), screenState, isFavorite, favoritesList,error];
}
