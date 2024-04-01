// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/delivery_attributes_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/product_response.dart';

class PaymentProcessParams {
  List<ProductResponse> productInBasketList;

  PaymentProcessParams({
    required this.productInBasketList,
  });

  Map<String, dynamic> toJson() {
    return {"products": ProductResponse.toJsonCardList(productInBasketList)};
  }

  Map<String, dynamic> toJsonWithParams(InvoicesParams invoicesParams) {

    return {
      "user_address_id": invoicesParams.userAddressId,
      "delivery_method_id": invoicesParams.deliveryMethodId,
      "notes": invoicesParams.notes,
      "products": ProductResponse.toJsonCardList(productInBasketList),
      "coupon_code": invoicesParams.couponCode,
      "coupon_id": invoicesParams.couponId,
    };
  }

  Map<String, dynamic> createOrderToJsonWithParams(
    InvoicesParams invoicesParams,
    List<DeliveryAttributesResponse>? deliveryAttributesList,
    List<ProductResponse> productInBasketList,
    List<int?>? deliveryChangesList,
  ) {
    return {
      "user_address_id": invoicesParams.userAddressId,
      "delivery_method_id": invoicesParams.deliveryMethodId,
      "notes": "${invoicesParams.notes} ",
      "start_time": invoicesParams.time,
      "products": ProductResponse.toJsonCardList(productInBasketList),
      "delivery_attributes": toJsonCardList(deliveryAttributesList),
      "payment_method_id": 1,
      "changes": deliveryChangesList,
      "coupon_code": invoicesParams.couponCode,
      "coupon_id": invoicesParams.couponId,
      // "changes": List<int>.from(deliveryChangesList!.map((x) => x)),
    };
  }

  static Map<String, dynamic> toJsonCard(
      DeliveryAttributesResponse deliveryAttributesList) {
    return {
      "delivery_attribute_id": deliveryAttributesList.id,
    };
  }

  static List<Map<String, dynamic>> toJsonCardList(
      List<DeliveryAttributesResponse>? deliveryAttributesList) {
    return deliveryAttributesList == null
        ? []
        : deliveryAttributesList.map((value) => toJsonCard(value)).toList();
  }
}
