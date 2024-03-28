import 'package:hive_flutter/adapters.dart';

part 'product_model.g.dart';

@HiveType(typeId: 4)
class   Product {
  @HiveField(0)
  int productId;
  @HiveField(1)
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });


  Map<String, dynamic> toJson() => {
        "product_id": productId,
     "quantity": quantity,
      };
}
