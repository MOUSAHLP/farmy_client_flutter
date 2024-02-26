import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/models/home_response.dart';

import '../../models/banners_response.dart';
import '../../models/categories_respoonse.dart';
import '../../models/endpoint_home_response.dart';
import '../../models/products_by_sub_category_id_response.dart';

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
            (l) => emit(state.copyWith(screenState: ScreenState.error,error: l)),
            (HomeResponse r) => emit(
                state.copyWith(screenState: ScreenState.success, homeData: r)));
      }
      if (event is GetHomeEndpoints) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await homeRepo.getHomeEndpoint()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) => emit(state.copyWith(
                screenState: ScreenState.success, endpointHome: r)));
      }
      if (event is GetCategory) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await homeRepo.getCategorySection()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) => emit(state.copyWith(
                screenState: ScreenState.success, categories: r)));
      }
      if (event is GetBanner) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await homeRepo.getBannerSection()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) => emit(
                state.copyWith(screenState: ScreenState.success, banners: r)));
      }
      if (event is GetProduct) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await homeRepo.getProductSection()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) => emit(
                state.copyWith(screenState: ScreenState.success, products: r)));
      }
    });
  }
}
