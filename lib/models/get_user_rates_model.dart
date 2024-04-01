class GetUserRatesModel {
  final String status;
  final String message;
  final List<Datum> data;
  final int statusCode;

  GetUserRatesModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory GetUserRatesModel.fromJson(Map<String, dynamic> json) => GetUserRatesModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    statusCode: json["statusCode"],
  );


}

class Datum {
  final int orderNumber;
  final DateTime createdAt;
  final int total;
  final int rate;

  Datum({
    required this.orderNumber,
    required this.createdAt,
    required this.total,
    required this.rate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderNumber: json["order_number"],
    createdAt: DateTime.parse(json["created_at"]),
    total: json["total"],
    rate: json["rate"],
  );


}
