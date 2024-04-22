// ignore_for_file: public_member_api_docs, sort_constructors_first
class RateAttribute {
  String value;
  int id;
  bool hasInput;

  RateAttribute({
    required this.value,
    required this.id,
    required this.hasInput
  });

  factory RateAttribute.fromJson(Map<String, dynamic> json) {
    return RateAttribute(
      id: json["id"],
      value: json["value"],
      hasInput: json["has_input"]

    );
  }
  static List<RateAttribute> listFromJson(List<dynamic>? json) {
    return json == null
    ? []
    : json.map((value) => RateAttribute.fromJson(value)).toList();
  }
}

class SelectedRateAttribute {
  int? id;
  String? input;

  SelectedRateAttribute({this.id, this.input});

  SelectedRateAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    input = json['input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['input'] =input;
    return data;
  }
}
