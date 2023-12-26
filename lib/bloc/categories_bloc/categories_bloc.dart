import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/categories_repo.dart';
import 'package:pharma/models/category_by_id_response.dart';
import 'package:pharma/models/sub_category_response.dart';

import '../../models/categories_respoonse.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesRepo categoriesRepo;
  CategoriesBloc({required this.categoriesRepo}) : super(CategoriesState()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetCaegoriesEvent) {
        emit(state.copyWith(screenState: ScreenState.loading));

        (await categoriesRepo.getALLCategories()).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)), (r) {
          List<CategoriesResponse> mutableCategories = List.from(r);
          mutableCategories.insert(
              0, CategoriesResponse(id: 0, name: "All Products"));

          emit(state.copyWith(
              screenState: ScreenState.success,
              categoriesList: mutableCategories));
        });
      }
      if (event is GetSubCategoryEvent) {
        emit(state.copyWith(isCategoryLoading: true));

        (await categoriesRepo.getCategoyById(event.categoryId)).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)), (r) {
          emit(state.copyWith(
              screenState: ScreenState.success,
              subCategoryList: r.subCategoryList));
        });
      }
    });
  }
}
