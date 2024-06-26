import 'package:hive_flutter/adapters.dart';
import 'package:pharma/models/product_response.dart';
part 'local_basket.g.dart';

@HiveType(typeId: 99)
class LocalBasket {
  @HiveField(0)
  List<ProductResponse> localBasketProducts;
  LocalBasket({required this.localBasketProducts});
}
