// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeleveryAttributesResponse {
  int? id;
  String? nameDeleveryAttribute;
  DeleveryAttributesResponse({
    this.id,
    this.nameDeleveryAttribute,
  });
  factory DeleveryAttributesResponse.fromJson(Map<String, dynamic> json) {
    return DeleveryAttributesResponse(
        id: json["id"], nameDeleveryAttribute: json["name"]);
  }

  static List<DeleveryAttributesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeleveryAttributesResponse.fromJson(value)).toList();
  }
}
