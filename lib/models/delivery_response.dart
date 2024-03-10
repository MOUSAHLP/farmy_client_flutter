// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeleveryMethodResponse {
  int? id;
  String? deleveryName;
  String? deleveytime;
  String? deleveyPrice;
  String? time;
  int? totalPrice;

  DeleveryMethodResponse({
    this.id,
    this.deleveryName,
    this.deleveytime,
    this.deleveyPrice,
    this.totalPrice,
    this.time,
  });

  factory DeleveryMethodResponse.fromJson(Map<String, dynamic> json) {
    return DeleveryMethodResponse(
      id: json["id"],
      deleveryName: json["name"],
      deleveytime: json["time"],
      totalPrice: json["total_price"],
      deleveyPrice: json["price"],
      time: json["time"],
    );
  }

  static List<DeleveryMethodResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeleveryMethodResponse.fromJson(value)).toList();
  }
}
