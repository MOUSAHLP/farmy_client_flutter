import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<FavoriteEvent>((event, emit) {
      if (event is ToggleFavorite) {
        emit(state.copyWith(isFavorite: event.isFavorite));
      }
    });
  }
}
