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

  /// test model of the response
  List test = [
    {
      "type": "slider",
      "order": 1,
      "title": "title",
      "link": "link",
      "content": List<BannersResponse>.filled(
          9,
          BannersResponse.fromJson(
            {
              "id": 3,
              "type": "section2",
              "link": "ch!@ch!.com",
              "start_time": "2024-01-17",
              "end_time": "2024-01-29",
              "created_at": "2024-01-02T06:21:04.000000Z",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/banners/25/backg-1.jpg"
            },
          ))
    },
    {
      "type": "section",
      "order": 2,
      "title": "title",
      "link": "link",
      "content": List<ProductsBySubCategoryIdResponse>.filled(
          12,
          ProductsBySubCategoryIdResponse.fromJson(
            {
              "id": 37,
              "name": "فليفلة مشكلة",
              "description":
                  "<p>-Doctorate in Islamic Law</p>\r\n<p>-Academic director and lecturer at various universities and institutions</p>\r\n<p>-More than 12 years of professional experience in the Halal sector</p>",
              "price": "2500",
              "tax": "21",
              "slug": null,
              "quantity": "2",
              "status": "1",
              "availability": "1",
              "seller": {"id": 2, "name": "test"},
              "subcategory": {"id": 1, "name": "بقدونس"},
              "category": {"id": 1, "name": "خضار"},
              "discount": "20",
              "discount_status": "1",
              "product_source": "0",
              "commission": {"id": 1, "name": "test", "commission_value": "10"},
              "created_at": "2024-01-01T09:43:25.000000Z",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/23/flyglh.jpg",
              "attributes": [
                {"id": 7, "name": "عدد القطع", "value": "1"},
                {"id": 8, "name": "الوزن", "value": "500g"}
              ]
            },
          )),
    }
  ];

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
