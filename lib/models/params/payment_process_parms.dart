// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
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

  Map<String, dynamic> toJsonWithParms(InvoicesParms invoicesParms) {
    return {
      "user_address_id": invoicesParms.userAddressid,
      "delivery_method_id": invoicesParms.deliveryMethodId,
      "notes": invoicesParms.notes,
      "products": ProductDetailsResponse.toJsonCardList(prodictInBasketList)
    };
  }

  Map<String, dynamic> createOrdertoJsonWithParms(
      InvoicesParms invoicesParms,
      List<DeliveryAttributesResponse>? deleveryAttributesList,
      List<ProductDetailsResponse> prodictInBasketList) {
    return {
      "user_address_id": invoicesParms.userAddressid,
      "delivery_method_id": invoicesParms.deliveryMethodId,
      "notes": "${invoicesParms.notes} ",
      "products": ProductDetailsResponse.toJsonCardList(prodictInBasketList),
      "delivery_attributes": toJsonCardList(deleveryAttributesList),
      "payment_method_id": 1,
    };
  }

  static Map<String, dynamic> toJsonCard(
      DeliveryAttributesResponse deleveryAttributesList) {
    return {
      "delivery_attribute_id": deleveryAttributesList.id,
    };
  }

  static List<Map<String, dynamic>> toJsonCardList(
      List<DeliveryAttributesResponse>? deleveryAttributesList) {
    return deleveryAttributesList == null
        ? []
        : deleveryAttributesList.map((value) => toJsonCard(value)).toList();
  }
}
