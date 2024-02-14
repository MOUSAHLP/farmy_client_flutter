part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final ScreenState? screenState;
  final bool? isFavorite;
  /// todo edit ProductsBySubCategoryIdResponse
  List<ProductsBySubCategoryIdResponse> favoritesList = [];

  FavoriteState(
      {this.screenState,
      this.isFavorite = false,
      this.favoritesList = const []});

  FavoriteState copyWith({bool? isFavorite, ScreenState? screenState}) {
    return FavoriteState(
      isFavorite: isFavorite ?? isFavorite,
      favoritesList: favoritesList,
      screenState: screenState ?? this.screenState,
    );
  }

  @override
  List<Object?> get props => [identityHashCode(this), screenState, isFavorite];
}
