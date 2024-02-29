import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/categories_repo.dart';
import 'package:pharma/models/sub_category_response.dart';

import '../../models/categories_respoonse.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesRepo categoriesRepo;

  CategoriesBloc({required this.categoriesRepo}) : super(CategoriesState()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetCaegoriesEvent) {
        emit(state.copyWith(
          tabIndex: 0,
          screenState: ScreenState.loading,
        ));

        (await categoriesRepo.getALLCategories()).fold((l) {
          emit(state.copyWith(tabIndex: 0, screenState: ScreenState.error));
        }, (r) {
          List<Widget> tabs = r.map((categoryList) {
            return Tab(
              text: categoryList.name,
            );
          }).toList();
          tabs.insert(
              0,
              const Tab(
                text: "All Products",
              ));
          emit(state.copyWith(
              tabIndex: 0,
              screenState: ScreenState.success,
              categoriesList: r,
              tabs: tabs));
        });
      } else if (event is GetSubCategoryEvent) {
        emit(state.copyWith(
          tabIndex: event.tabIndex,
          previousSubCategoryIndex: event.tabIndex,
          screenState: ScreenState.loading,
        ));

        (await categoriesRepo.getSubCategoryById(event.categoryId)).fold((l) {
          if (l != "cancel") {
            emit(state.copyWith(
                tabIndex: event.tabIndex, screenState: ScreenState.error));
          }
        }, (r) {
          emit(state.copyWith(
              tabIndex: event.tabIndex,
              screenState: ScreenState.success,
              subCategoryList: r.subCategoryList));
        });
      } else if (event is AllProductsPageEvent) {
        emit(state.copyWith(
          tabIndex: 0,
          screenState: ScreenState.success,
        ));
      } else if (event is SubCategoryPageEvent) {
        emit(state.copyWith(
          tabIndex: event.tabIndex,
          previousSubCategoryIndex: event.tabIndex,
          screenState: ScreenState.success,
        ));
      }
    });
  }
}
