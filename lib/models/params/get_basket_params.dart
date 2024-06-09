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
  int price;
  GetBasketParams({required this.id, this.products = const [], this.price = 0});

  Map<String, dynamic> toJson() => {
        "id": id,
        "idProducts": products,
        "price": price,
      };

  static Map<String, dynamic> getCartPriceResponse(Map<String, dynamic> json) {
    Map<String, dynamic> data = {};

    json.keys.forEach((element) {
      data[element] = json[element];
    });
    return data;
  }

  factory GetBasketParams.fromGetExternalVisitsParams(GetBasketParams params) =>
      GetBasketParams(
        id: params.id,
        products: params.products,
        price: params.price,
      );

  GetBasketParams copyWith({
    required int? id,
    required List<Product>? idProducts,
  }) {
    return GetBasketParams(
      id: id ?? 0,
      products: idProducts ?? [],
      price: price ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        products,
        price,
      ];
}
