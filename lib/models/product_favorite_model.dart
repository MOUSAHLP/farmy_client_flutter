// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pharma/models/attribute_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

class ProductFavoriteModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? tax;
  String? slug;
  String? quantity;
  String? status;
  int? availability;

  Seller? sellerName;
  String? discountStatus;
  String? discountValue;
  String? image;


  ProductFavoriteModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.tax,
    this.slug,
    this.quantity,
    this.status,
    this.availability,

    this.sellerName,
    this.discountStatus,
    this.discountValue,

    this.image,


  });
  factory ProductFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ProductFavoriteModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      tax: json["tax"],
      slug: json["slug"],
      quantity: json["quantity"],
      status: json["status"],
      sellerName: json['seller'],
      availability: json["availability:"],
      discountValue: json["discount"],
      discountStatus: json["discount_status"],
      image: json["image"], //todo
    );
  }
}
class Seller{
  int? id;
  String? name;

  Seller({this.id, this.name});
  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      name: json['name']
    );}
}
