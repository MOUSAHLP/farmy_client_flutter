

import 'package:pharma/models/attribute_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

class ProductDetailsResponse {
  int id;
  String? nameOfProduct;
  String? price;
  int? quantity;
  List<AttrbiuteResponse> attributeList;
  String? availabilityOfProduct;
  String? sellerName;
  String? discountStatus;
  String? discountValue;
  String? image;
  String? description;
  bool? isDiscount;
  bool isFavorite;

  List<ProductsBySubCategoryIdResponse>? relatedProducts;
  List<ProductsBySubCategoryIdResponse>? similarProducts;

  ProductDetailsResponse({
    required this.id,
    this.nameOfProduct,
    this.price,
    this.quantity,
    this.attributeList = const [],
    this.availabilityOfProduct,
    this.sellerName,
    this.discountStatus,
    this.discountValue,
    this.isDiscount,
    this.image,
    this.description,
    this.relatedProducts,
    this.similarProducts,
    this.isFavorite=false
  });
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return json["availability"] == "1"
        ? ProductDetailsResponse(
            id: json["id"],

        quantity: json["quantity"] != null ? int.parse(json["quantity"]) : null,

        description: json["description"],
            discountStatus: json["discount_status"],
            discountValue: json["discount_status"] != 0
                ? getDiscountedPrice(json["price"], json["discount"])
                : json["discount"],
            sellerName: json["seller"] == null ? null : json["seller"]["name"],
            nameOfProduct: json["name"],
            price: json["price"],
            attributeList: json["attributes"] == null
                ? []
                : List<AttrbiuteResponse>.from(json["attributes"]
                    .map((x) => AttrbiuteResponse.fromJson(x))),
            image: json["image"],
        isFavorite: json["is_favorite"],
            relatedProducts: json["related_products"] == null
                ? []
                : List<ProductsBySubCategoryIdResponse>.from(
                    json["related_products"].map(
                        (x) => ProductsBySubCategoryIdResponse.fromJson(x))),
            similarProducts: json["related_products"] == null
                ? []
                : List<ProductsBySubCategoryIdResponse>.from(
                    json["similar_products"].map(
                        (x) => ProductsBySubCategoryIdResponse.fromJson(x))))
        : ProductDetailsResponse( id: 0,);
  }
  static Map<String, dynamic> toJsonCard(
      ProductDetailsResponse productDetailsResponse) {
    return {
      "product_id": productDetailsResponse.id,
      "quantity": productDetailsResponse.quantity
    };
  }

  static List<Map<String, dynamic>> toJsonCardList(
      List<ProductDetailsResponse>? basketList) {
    return basketList == null
        ? []
        : basketList
            .map((value) => ProductDetailsResponse.toJsonCard(value))
            .toList();
  }

  static String getDiscountedPrice(String price, String discount) {
    int originalPrice = int.parse(price);
    int discountPrcie = int.parse(discount);

    int percantge = (((discountPrcie * 100) / originalPrice)).round();

    return percantge.toString();
  }

  static List<ProductsBySubCategoryIdResponse> listFromJson(
      List<dynamic>? json) {
    return json == null
        ? []
        : json
            .map((value) => ProductsBySubCategoryIdResponse.fromJson(value))
            .toList();
  }
}
