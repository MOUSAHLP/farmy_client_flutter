// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttrbiuteResponse {
  String value;

  AttrbiuteResponse({
    required this.value,
  });

  factory AttrbiuteResponse.fromJson(Map<String, dynamic> json) {
    return AttrbiuteResponse(
      value: json["value"],
    );
  }

  static List<AttrbiuteResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => AttrbiuteResponse.fromJson(value)).toList();
  }
}
