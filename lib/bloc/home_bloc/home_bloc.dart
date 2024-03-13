import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
import 'package:pharma/models/home_response.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../models/banners_response.dart';
import '../../models/categories_respoonse.dart';
import '../../models/endpoint_home_response.dart';
import '../../models/product_details_response.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  int lastPagePagination = 1;
  int indexPagePagination = 2;
  HomeRepo homeRepo;

  List<HomePageDynamicModel>? homePageDynamicModel;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  HomeBloc({required this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetHomeData) {
        emit(state.copyWith(screenState: ScreenState.loading));

        (await homeRepo.getHomeDynamicData()).fold(
            (l) =>
                emit(state.copyWith(screenState: ScreenState.error, error: l)),
            (List<HomePageDynamicModel> r) {
          refreshController.resetNoData();
          indexPagePagination = 2;
          homePageDynamicModel = r;
          lastPagePagination = homePageDynamicModel![0].lastPagePagination!;

          emit(state.copyWith(screenState: ScreenState.success));
        });
      } else if (event is OnLoadingHomeData) {
        await getPagination(emit);
      }
    });
  }

  Future<void> getPagination(Emitter<HomeState> emit) async {
    if (indexPagePagination > lastPagePagination) {
      refreshController.loadNoData();
    } else {
      emit(state.copyWith(screenState: ScreenState.loadMoreData));
      await refreshController.requestLoading();

      (await homeRepo.getHomeDynamicData(page: indexPagePagination)).fold(
          (String l) =>
              emit(state.copyWith(screenState: ScreenState.error, error: l)),
          (List<HomePageDynamicModel> r) {
        homePageDynamicModel!.addAll(r);
        indexPagePagination++;
        emit(state.copyWith(screenState: ScreenState.success));
      });
      refreshController.loadComplete();
    }
  }
}
