class RewardHistoryModel {
  final String status;
  final String message;
  final List<Datum> data;
  final int statusCode;

  RewardHistoryModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardHistoryModel.fromJson(Map<String, dynamic> json) =>
      RewardHistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["statusCode"],
      );
}

class Datum {

  final int id;
  final dynamic userId;
  final dynamic points;
  final dynamic usedPoints;
  final dynamic achievementId;
  final dynamic createdAt;
  final dynamic usedAt;
  final dynamic expireAt;
  final dynamic expired;

  Datum({
    required this.id,
    required this.userId,
    required this.points,
    required this.usedPoints,
    required this.achievementId,
    required this.createdAt,
    required this.usedAt,
    required this.expireAt,
    required this.expired,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        points: json["points"],
        usedPoints: json["used_points"],
        achievementId: json["achievement_id"],
        createdAt: DateTime.parse(json["created_at"]),
        usedAt: json["used_at"],
        expireAt: DateTime.parse(json["expire_at"]),
        expired: json["is_expired"],
      );
}
