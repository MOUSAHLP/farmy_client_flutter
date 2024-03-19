class RewardGuideModel {
  final String status;
  final String message;
  final Data data;
  final int statusCode;

  RewardGuideModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardGuideModel.fromJson(Map<String, dynamic> json) => RewardGuideModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );
}

class Data {
  final String html;

  Data({
    required this.html,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        html: json["html"],
      );
}
