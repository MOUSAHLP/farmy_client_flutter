class RewardMembershipGuideModel {
  final String status;
  final String message;
  final Data data;
  final int statusCode;

  RewardMembershipGuideModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardMembershipGuideModel.fromJson(Map<String, dynamic> json) =>
      RewardMembershipGuideModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );
}

class Data {
  final String html;
  final List<Rank> ranks;

  Data({
    required this.html,
    required this.ranks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        html: json["html"],
        ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
      );
}

class Rank {
  final int id;
  final String name;
  final String limit;
  final Features features;
  final String description;
  final String color;

  Rank({
    required this.id,
    required this.name,
    required this.limit,
    required this.features,
    required this.description,
    required this.color,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        id: json["id"],
        name: json["name"],
        limit: json["limit"],
        features: Features.fromJson(json["features"]),
        description: json["description"],
        color: json["color"],
      );
}

class Features {
  final int couponPerMounth;
  final int discountOnDeliver;

  Features({
    required this.couponPerMounth,
    required this.discountOnDeliver,
  });

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        couponPerMounth: json["coupon_per_mounth"],
        discountOnDeliver: json["discount_on_deliver"],
      );
}
