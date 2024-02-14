import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/models/home_response.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  HomeRepo homeRepo;

  HomeBloc({required this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetHomeData) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await homeRepo.getHomeData()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) => emit(
                state.copyWith(screenState: ScreenState.success, homeData: r)));
      }
    });
  }
}
