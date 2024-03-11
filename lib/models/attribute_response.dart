// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttributeResponse {
  String value;

  AttributeResponse({
    required this.value,
  });

  factory AttributeResponse.fromJson(Map<String, dynamic> json) {
    return AttributeResponse(
      value: json["value"],
    );
  }

  static List<AttributeResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => AttributeResponse.fromJson(value)).toList();
  }
}
