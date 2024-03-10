// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/banners_response.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/models/user_address_response.dart';

class HomeResponse {
  List<CategoriesResponse>? homeCategoriesList;
  List<ProductResponse>? homeSuggestedProductsList;
  List<ProductResponse>? homeDiscountedProductsList;
  List<BannersResponse>? homeBannerListTopSection;
  List<BannersResponse>? homeBannerListBottomSection;
  UserAddressModel? userAddressModel;
  HomeResponse(
      {this.homeCategoriesList,
      this.userAddressModel,
      this.homeSuggestedProductsList,
      this.homeDiscountedProductsList,
      this.homeBannerListTopSection,
      this.homeBannerListBottomSection});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      userAddressModel: json["favourite_address"] != null
          ? UserAddressModel.fromJson(json["favourite_address"])
          : UserAddressModel(),
      homeCategoriesList: json["categories"] == null
          ? []
          : List<CategoriesResponse>.from(
              json["categories"].map((x) => CategoriesResponse.fromJson(x))),
      homeBannerListTopSection: json["Banners"] == null
          ? []
          : List<BannersResponse>.from(json["Banners"]
              .where(
                (banner) => banner["type"] == "section1",
              )
              .map((x) => BannersResponse.fromJson(x))),
      homeBannerListBottomSection: json["Banners"] == null
          ? []
          : List<BannersResponse>.from(json["Banners"]
              .where(
                (banner) => banner["type"] == "section2",
              )
              .map((x) => BannersResponse.fromJson(x))),
      homeSuggestedProductsList: json["suggested-Products"] == null
          ? []
          : List<ProductResponse>.from(
              json["suggested-Products"]
                  .map((x) => ProductResponse.fromJson(x))),
      homeDiscountedProductsList: json["discounted-Products"] == null
          ? []
          : List<ProductResponse>.from(
              json["discounted-Products"]
                  .map((x) => ProductResponse.fromJson(x))),
    );
  }
}
