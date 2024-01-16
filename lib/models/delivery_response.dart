// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeleveryMethodResponse {
  int? id;
  String? deleveryName;
  String? deleveytime;
  int? deleveyPrice;
  DeleveryMethodResponse({
    this.id,
    this.deleveryName,
    this.deleveytime,
    this.deleveyPrice,
  });

  factory DeleveryMethodResponse.fromJson(Map<String, dynamic> json) {
    return DeleveryMethodResponse(
        id: json["id"],
        deleveryName: json["name"],
        deleveytime: json["time"],
        deleveyPrice: json["total_price"]);
  }

  static List<DeleveryMethodResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeleveryMethodResponse.fromJson(value)).toList();
  }
}
