// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/delivery_changes_response.dart';
import 'package:pharma/models/delivery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/invoices_response.dart';
import 'package:pharma/models/user_address_response.dart';

class PaymentProcessResponse {
  InvociesResponse? invoicesResponse;
  List<DeliveryMethodResponse>? deliveryMethodList;
  List<DeliveryAttributesResponse>? deliveryAttributeList;
  List<DeliveryChangesResponse> deliveryChangesResponse;
  List<UserAddressModel>? userAddressList;

  PaymentProcessResponse({
    this.userAddressList,
    this.invoicesResponse,
    this.deliveryMethodList,
    this.deliveryAttributeList,
    required this.deliveryChangesResponse,
  });

  factory PaymentProcessResponse.fromJson(Map<String, dynamic> json) {
    return PaymentProcessResponse(
      userAddressList: UserAddressModel.listFromJson(json["user_address"]),
      invoicesResponse: InvociesResponse.formJson(json["invoice"]),
      deliveryMethodList: DeliveryMethodResponse.listFromJson(json["delivery_methods"]),
      deliveryAttributeList: DeliveryAttributesResponse.listFromJson(json["delivery_attributes"]),
      deliveryChangesResponse: DeliveryChangesResponse.listFromJson(json["changes"]),
    );
  }
}
