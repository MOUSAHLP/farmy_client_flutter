class RewardsRankUserModel {
  final String status;
  final String message;
  final Data data;
  final int statusCode;
  final List<Rank> ranks;

  RewardsRankUserModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
    required this.ranks,
  });

  factory RewardsRankUserModel.fromJson(Map<String, dynamic> json) =>
      RewardsRankUserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
        ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
      );
}

class Data {
  final int userPoints;
  final int pointsValue;
  final Rank userRank;
  final Rank userNextRank;

  Data({
    required this.userPoints,
    required this.pointsValue,
    required this.userRank,
    required this.userNextRank,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userPoints: json["user_points"],
        pointsValue: json["points_value"],
        userRank: Rank.fromJson(json["user_rank"]),
        userNextRank: Rank.fromJson(json["user_next_rank"]),
      );
}

class Rank {
  final int id;
  final String name;
  final int limit;
  final String description;
  final String color;
  final List<Feature> features;

  Rank({
    required this.id,
    required this.name,
    required this.limit,
    required this.description,
    required this.color,
    required this.features,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        id: json["id"],
        name: json["name"],
        limit: json["limit"],
        description: json["description"],
        color: json["color"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );
}

class Feature {
  final String name;
  final int value;
  final String description;

  Feature({
    required this.name,
    required this.value,
    required this.description,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        name: json["name"],
        value: json["value"],
        description: json["description"],
      );
}
