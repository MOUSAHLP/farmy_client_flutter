import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_enum.dart';
import 'rate_event.dart';
import 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  // CategoriesRepo categoriesRepo;
  RateBloc(/*{required this.categoriesRepo}*/)
      : super(const RateState(screenState: ScreenState.initialized)) {
    on<RateEvent>((event, emit) async {
      if (event is SubmitRate) {
        emit(state.copyWith(screenState: ScreenState.loading));
        // (await categoriesRepo.getProductsBySubCategoriesId(event.rate)).fold((l) {
        //   if (l != "cancel") {
        //     emit(state.copyWith(screenState: ScreenState.error));
        //   }
        // }, (r) {
        //   List<ProductsBySubCategoryIdResponse> mutableProducts = List.from(r);
        //   mutableProducts.removeWhere(
        //         (element) {
        //       return element.id == null;
        //     },
        //   );
        emit(state.copyWith(screenState: ScreenState.success));
      }
    });
  }
}
