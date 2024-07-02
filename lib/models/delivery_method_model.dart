class DeliveryMethodModel {
  int? id;
  String? name;
  bool? isSchedule;

  DeliveryMethodModel({
    this.name,
    this.id,
    this.isSchedule,
  });

  factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) {
    return DeliveryMethodModel(
      id: json["id"],
      name: json["name"],
      isSchedule: json["is_schedule"],
    );
  }
}
