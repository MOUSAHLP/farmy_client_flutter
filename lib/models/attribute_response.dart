import 'package:hive/hive.dart';

part 'attribute_response.g.dart';

@HiveType(typeId: 100)
class AttributeResponse {
  @HiveField(0)
  String value;

  @HiveField(1)
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
