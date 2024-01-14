part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final bool? isFavorite;
  const FavoriteState({this.isFavorite = false});
  FavoriteState copyWith({bool? isFavorite}) {
    return FavoriteState(isFavorite:isFavorite??isFavorite );
  }

  @override
  List<Object?> get props => [
    isFavorite
  ];
}
