// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/product_details_response.dart';

class PaymentProcessParms {
  List<ProductDetailsResponse> prodictInBasketList;
  PaymentProcessParms({
    required this.prodictInBasketList,
  });

  Map<String, dynamic> toJson() {
    return {
      "products": ProductDetailsResponse.toJsonCardList(prodictInBasketList)
    };
  }
}
