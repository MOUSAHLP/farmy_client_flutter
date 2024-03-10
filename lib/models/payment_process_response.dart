// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/invocies_response.dart';
import 'package:pharma/models/user_address_response.dart';

class PaymentProcessResponse {

  InvociesResponse? invociesResponse;
  List<DeleveryMethodResponse>? deleveryMethodList;
  List<DeliveryAttributesResponse>? deleveryAttributesList;
  List<UserAddressModel>? userAdressList;

  PaymentProcessResponse({
    this.userAdressList,
    this.invociesResponse,
    this.deleveryMethodList,
    this.deleveryAttributesList,
  });

  factory PaymentProcessResponse.fromJson(Map<String, dynamic> json) {
    return PaymentProcessResponse(
        userAdressList: UserAddressModel.listFromJson(json["user_address"]),
        invociesResponse: InvociesResponse.formJson(json["invoice"]),
        deleveryMethodList:DeleveryMethodResponse.listFromJson(json["delivery_methods"]),
        deleveryAttributesList: DeliveryAttributesResponse.listFromJson(json["delivery_attributes"]));
  }
}
