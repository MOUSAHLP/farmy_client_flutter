import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
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
  List<HomePageDynamicModel>? homePageDynamicModel;

  /// test model of the dynamic response
  List<Map<String, dynamic>> testwePhase2 = [
    {
      "type": "category",
      "order": 1,
      "title": {
        "en": "category title en",
        "ar": "category title ar",
      },
      "link": "link",
      "content": [
        {
          "id": 1,
          "name": " خضار",
          "status": "1",
          "created_at": "2023-12-07T14:22:22.000000Z",
          "image":
              "https://control.farmy.peaklink.site/public/storage/categories/29/b6a6a.jpg",
          "subcategories": [
            {
              "id": 1,
              "name": "بقدونس",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/13/flyglh.jpg"
            },
            {
              "id": 2,
              "name": "فليفلة اصفر",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/13/flyglh.jpg"
            }
          ]
        },
        {
          "id": 1,
          "name": " tsss",
          "status": "1",
          "created_at": "2023-12-07T14:22:22.000000Z",
          "image":
              "https://control.farmy.peaklink.site/public/storage/categories/29/b6a6a.jpg",
          "subcategories": [
            {
              "id": 1,
              "name": "بقدونس",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/13/flyglh.jpg"
            },
            {
              "id": 2,
              "name": "فليفلة اصفر",
              "image":
                  "https://control.farmy.peaklink.site/public/storage/13/flyglh.jpg"
            }
          ]
        },
      ]
    },
    {
      "type": "section",
      "order": 2,
      "title": {
        "en": "title en 11111111111",
        "ar": "title ar 1111111111",
      },
      "link": "link",
      "content": [
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
          "discount_status": "0",
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
        {
          "id": 37,
          "name": "2فليفلة مشكلة",
          "description":
              "<p>-Doctorate in Islamic Law</p>\r\n<p>-Academic director and lecturer at various universities and institutions</p>\r\n<p>-More than 12 years of professional experience in the Halal sector</p>",
          "price": "2800",
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
      ]
    },
    {
      "type": "slider",
      "order": 3,
      "title": {
        "en": "title en",
        "ar": "title ar",
      },
      "link": "link",
      "content": [
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
      ]
    },
  ];

  HomeBloc({required this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetHomeData) {
        emit(state.copyWith(screenState: ScreenState.loading));

        // need to link it with API
        homePageDynamicModel =
            HomePageDynamicModel().fromJsonList(testwePhase2);

        // insted of this
        (await homeRepo.getHomeData()).fold(
            (l) =>
                emit(state.copyWith(screenState: ScreenState.error, error: l)),
            (HomeResponse r) => emit(
                state.copyWith(screenState: ScreenState.success, homeData: r)));
      }
    });
  }
}
