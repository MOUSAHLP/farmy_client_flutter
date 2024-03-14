import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_event.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_state.dart';
import 'package:pharma/data/repository/home_section_all_products_repo.dart';
import 'package:pharma/models/product_response.dart';

class HomeSectionAllProductsBloc
    extends Bloc<HomeSectionAllProductsEvent, HomeSectionAllProductsState> {
  List<ProductResponse>? allProductResponse;
  HomeSectionAllProductsBloc() : super(HomeSectionAllProductsInit()) {
    on<HomeSectionAllProductsEvent>((event, emit) async {
      if (event is GetHomeSectionAllProducts) {
        emit(HomeSectionAllProductsLoading());
        var response =
            await HomeSectionAllProductsRepo.getHomeAllProductById(event.id);
        response.fold((l) {
          emit(HomeSectionAllProductsError(l));
        }, (r) {
          allProductResponse = r;
          emit(HomeSectionAllProductsSuccess());
        });
      }
    });
  }
}
