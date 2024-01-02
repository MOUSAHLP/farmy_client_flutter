// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/attribute_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

class ProductDetailsResponse {
  int? id;
  String? nameOfProduct;
  String? price;
  List<AttrbiuteResponse>? attributeList;
  String? availabilityOfProduct;
  String? sellerName;
  String? discount;
  String? image;
  String? description;

  List<ProductsBySubCategoryIdResponse>? relatedProducts;
  List<ProductsBySubCategoryIdResponse>? similarProducts;
  ProductDetailsResponse({
    this.id,
    this.nameOfProduct,
    this.price,
    this.attributeList,
    this.availabilityOfProduct,
    this.sellerName,
    this.discount,
    this.image,
    this.description,
    this.relatedProducts,
    this.similarProducts,
  });
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return json["availability"] == "1"
        ? ProductDetailsResponse(
            id: json["id"],
            description: json["description"],
            nameOfProduct: json["name"],
            price: json["price"],
            attributeList: json["attributes"] == null
                ? []
                : List<AttrbiuteResponse>.from(json["attributes"]
                    .map((x) => AttrbiuteResponse.fromJson(x))),
            image: json["image"],
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
        : ProductDetailsResponse();
  }
}
