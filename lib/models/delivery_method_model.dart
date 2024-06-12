


class DeliveryMethodModel {
  int? id;
  String? name;


  DeliveryMethodModel({

    this.name,
    this.id,

  });

  factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) {
    return DeliveryMethodModel(
      id: json["id"],
      name: json["name"],


    );
  }

}