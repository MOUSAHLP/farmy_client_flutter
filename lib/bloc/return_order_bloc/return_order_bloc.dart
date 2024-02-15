import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_enum.dart';
import 'return_order_event.dart';
import 'return_order_state.dart';

class ReturnOrderBloc extends Bloc<ReturnOrderEvent, ReturnOrderState> {
  // CategoriesRepo categoriesRepo;
  ReturnOrderBloc(/*{required this.categoriesRepo}*/)
      : super(const ReturnOrderState(screenState: ScreenState.initialized)) {
    on<ReturnOrderEvent>((event, emit) async {
      if (event is SubmitReturnOrder) {
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
