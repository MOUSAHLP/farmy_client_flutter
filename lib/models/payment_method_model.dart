
class PaymentMethodModel {
  int? id;
  String? name;
  PaymentMethodModel({
    this.name,
    this.id,

  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json["id"],
      name: json["name"],


    );
  }

}