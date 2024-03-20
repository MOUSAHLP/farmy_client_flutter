import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pharma/models/params/product_model.dart';


part 'get_basket_params.g.dart';

// ignore: must_be_immutable
@HiveType(typeId: 3)
class GetBasketParams extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  List<Product> products;
  GetBasketParams({
   required this.id,
    this.products=const []
  });

  Map<String, dynamic> toJson() => {
        "id": id,
    "idProducts":products
      };

  factory GetBasketParams.fromGetExternalVisitsParams(
          GetBasketParams params) =>
      GetBasketParams(
        id: params.id,
        products: params.products,
      );

  GetBasketParams copyWith(
      {
        required int? id,
        required List<Product>? idProducts,
     }) {
    return GetBasketParams(
      id: id??0,
      products: idProducts??[],

    );
  }

  @override
  List<Object?> get props =>
      [id,
        products];
}
