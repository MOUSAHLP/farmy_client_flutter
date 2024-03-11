// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryChangesResponse {
  int? id;
  int? value;

  DeliveryChangesResponse({
    this.id,
    this.value,
  });

  factory DeliveryChangesResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryChangesResponse(
      id: json["id"],
      value: json["value"],
    );
  }

  static List<DeliveryChangesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeliveryChangesResponse.fromJson(value)).toList();
  }
}
