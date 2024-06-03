import 'package:pharma/models/params/product_model.dart';

class BasketNotInstall {
  final List<BasketProduct> basketProduct;

  BasketNotInstall({
    required this.basketProduct,
  });

  static Map<String, dynamic> toJson(Map<String, List<Product>> mp) => {};
}

class BasketProduct {
  final int productId;
  final int quantity;

  BasketProduct({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
