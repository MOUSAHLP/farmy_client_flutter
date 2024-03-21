class RewardCouponsActivityModel {
  final String status;
  final String message;
  final List<Datum> data;
  final int statusCode;

  RewardCouponsActivityModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardCouponsActivityModel.fromJson(Map<String, dynamic> json) =>
      RewardCouponsActivityModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["statusCode"],
      );
}

class Datum {
  final int id;
  final String achievement;
  final String points;
  final String description;
  final int segments;
  final int achievementsDoneCount;

  Datum({
    required this.id,
    required this.achievement,
    required this.points,
    required this.description,
    required this.segments,
    required this.achievementsDoneCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        achievement: json["achievement"],
        points: json["points"],
        description: json["description"],
        segments: json["segments"],
        achievementsDoneCount: json["achievements_done_count"],
      );
}
