// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/delivery_response.dart';
import 'package:pharma/models/invocies_response.dart';

class PaymentProcessResponse {
  String? userAdress;
  InvociesResponse? invociesResponse;
  List<DeleveryMethodResponse>? deleveryMethodList;
  List<DeleveryAttributesResponse>? deleveryAttributesList;
  PaymentProcessResponse({
    this.userAdress,
    this.invociesResponse,
    this.deleveryMethodList,
    this.deleveryAttributesList,
  });

  factory PaymentProcessResponse.fromJson(Map<String, dynamic> json) {
    return PaymentProcessResponse(
        userAdress: json["user_address"],
        invociesResponse: InvociesResponse.formJson(json["invoice"]),
        deleveryMethodList:
            DeleveryMethodResponse.listFromJson(json["delivery_methods"]),
        deleveryAttributesList: DeleveryAttributesResponse.listFromJson(
            json["delivery_attributes"]));
  }
}
