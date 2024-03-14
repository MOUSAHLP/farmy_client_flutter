// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttributeResponse {
  String value;
  String name;

  AttributeResponse({
    required this.value,
    required this.name,
  });

  factory AttributeResponse.fromJson(Map<String, dynamic> json) {
    return AttributeResponse(
      value: json["value"],
      name: json["name"],
    );
  }

  static List<AttributeResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => AttributeResponse.fromJson(value)).toList();
  }
}
