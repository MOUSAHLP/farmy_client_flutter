import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
import 'package:pharma/models/home_response.dart';
import 'package:flutter/material.dart';

import '../../models/banners_response.dart';
import '../../models/categories_respoonse.dart';
import '../../models/endpoint_home_response.dart';
import '../../models/product_response.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  int lastPagePagination = 1;
  int indexPagePagination = 2;
  HomeRepo homeRepo;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

  List<HomePageDynamicModel>? homePageDynamicModel;

  HomeBloc({required this.homeRepo}) : super(const HomeState()) {
    scrollController.addListener(_scrollListener);
    on<HomeEvent>((event, emit) async {
      if (event is GetHomeData) {
        emit(state.copyWith(screenState: ScreenState.loading));

        (await homeRepo.getHomeDynamicData()).fold(
            (l) =>
                emit(state.copyWith(screenState: ScreenState.error, error: l)),
            (List<HomePageDynamicModel> r) {
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
      print("no More Data");
    } else {
      emit(state.copyWith(screenState: ScreenState.loadMoreData));
      (await homeRepo.getHomeDynamicData(page: indexPagePagination)).fold(
          (String l) =>
              emit(state.copyWith(screenState: ScreenState.error, error: l)),
          (List<HomePageDynamicModel> r) {
        homePageDynamicModel!.addAll(r);
        indexPagePagination++;
        emit(state.copyWith(screenState: ScreenState.success));
      });
    }
  }

  Widget buildListViewFooter() {
    Widget? body;
    if (state.screenState == ScreenState.loadMoreData) {
      body = const CircularProgressIndicator();
    }
    // else if (indexPagePagination > lastPagePagination) {
    //   body = const Text("No More Data");
    // }
    else {
      body = null;
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        indexPagePagination <= lastPagePagination) {
      add(OnLoadingHomeData());
    }
  }
}
