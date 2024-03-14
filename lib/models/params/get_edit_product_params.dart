import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

class GetEditProductParams extends Equatable {
  List<Product> products;

  GetEditProductParams({
    this.products = const [],
  });

  Map<String, dynamic> toJson() => {"products": products};



  factory GetEditProductParams.fromEditProductParams(
          GetEditProductParams params) =>
      GetEditProductParams(
        products: params.products,
      );

  GetEditProductParams copyWith({
    required List<Product>? products,
  }) {
    return GetEditProductParams(
      products: products ?? [],
    );
  }

  @override
  List<Object?> get props => [
        products,
      ];
}

class Product {
  int id;
  int quantity;

  Product({required this.id, required this.quantity});

  Map<String, dynamic> toJson() => {
        "product_id": id,
        "quantity": quantity,
      };
}
