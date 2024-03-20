
import 'package:hive_flutter/adapters.dart';
import 'package:pharma/models/params/get_basket_params.dart';
part 'basket_model.g.dart';

@HiveType(typeId: 2)
class BasketModel{
  @HiveField(0)
  List<GetBasketParams> basketList;
  BasketModel({required this.basketList});
}