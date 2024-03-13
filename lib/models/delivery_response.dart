// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryMethodResponse {
  int id;
  String? deliveryName;
  String? deliveryTime;
  String? deliveryPrice;
  int? totalPrice;

  DeliveryMethodResponse({
    required this.id,
    this.deliveryName,
    this.deliveryTime,
    this.deliveryPrice,
    this.totalPrice,
  });

  factory DeliveryMethodResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryMethodResponse(
      id: json["id"],
      deliveryName: json["name"],
      deliveryTime: json["time"],
      totalPrice: json["total_price"],
      deliveryPrice: json["price"],
    );
  }

  static List<DeliveryMethodResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => DeliveryMethodResponse.fromJson(value)).toList();
  }
}
