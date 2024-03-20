import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

// part 'get_external_params.g.dart';
part 'get_basket_params.g.dart';

// ignore: must_be_immutable
@HiveType(typeId: 3)
class GetBasketParams extends Equatable {
  @HiveField(0)
  int? id;

  @HiveField(1)
  List<int> idProducts;
  GetBasketParams({
    this.id,
    this.idProducts=const []
  });

  Map<String, dynamic> toJson() => {
        "id": id,
    "idProducts":idProducts
      };

  factory GetBasketParams.fromGetExternalVisitsParams(
          GetBasketParams params) =>
      GetBasketParams(
        id: params.id,
        idProducts: params.idProducts,
      );

  GetBasketParams copyWith(
      {
        required int? id,
        required List<int>? idProducts,
     }) {
    return GetBasketParams(
      id: id,
      idProducts: idProducts??[],

    );
  }

  @override
  List<Object?> get props =>
      [id,
        idProducts];
}
