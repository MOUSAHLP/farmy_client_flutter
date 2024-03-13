// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryAttributesResponse {
  int? id;
  String? nameDeliveryAttribute;

  DeliveryAttributesResponse({
    this.id,
    this.nameDeliveryAttribute,
  });

  factory DeliveryAttributesResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryAttributesResponse(
        id: json["id"], nameDeliveryAttribute: json["name"]);
  }

  static List<DeliveryAttributesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json
            .map((value) => DeliveryAttributesResponse.fromJson(value))
            .toList();
  }
}
