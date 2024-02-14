// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryAttributesResponse {
  int? id;
  String? nameDeleveryAttribute;
  DeliveryAttributesResponse({
    this.id,
    this.nameDeleveryAttribute,
  });
  factory DeliveryAttributesResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryAttributesResponse(
        id: json["id"], nameDeleveryAttribute: json["name"]);
  }

  static List<DeliveryAttributesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeliveryAttributesResponse.fromJson(value)).toList();
  }
}
