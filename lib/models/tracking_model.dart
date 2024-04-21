import 'dart:convert';

class GetUserRatesModel {
  final double lat;
  final double long;
  final String status;

  GetUserRatesModel({
    required this.lat,
    required this.long,
    required this.status,
  });

  factory GetUserRatesModel.fromJson(Map<String, dynamic> json) =>
      GetUserRatesModel(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        status: json["status"],
      );
}
