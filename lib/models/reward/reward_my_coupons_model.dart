class RewardMyCouponsModel {
  final String status;
  final String message;
  final List<Datum> data;
  final int statusCode;

  RewardMyCouponsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardMyCouponsModel.fromJson(Map<String, dynamic> json) =>
      RewardMyCouponsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["statusCode"],
      );
}

class Datum {
  final int id;
  final String couponTypeId;
  final String value;
  final String couponCode;
  final String description;
  final DateTime createdAt;
  final CouponType couponType;

  Datum({
    required this.id,
    required this.couponTypeId,
    required this.value,
    required this.couponCode,
    required this.description,
    required this.createdAt,
    required this.couponType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        couponTypeId: json["coupon_type_id"],
        value: json["value"],
        couponCode: json["coupon_code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        couponType: CouponType.fromJson(json["coupon_type"]),
      );
}

class CouponType {
  final int id;
  final String name;
  final String image;
  final bool isPercentage;

  CouponType({
    required this.id,
    required this.name,
    required this.image,
    required this.isPercentage,
  });

  factory CouponType.fromJson(Map<String, dynamic> json) => CouponType(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isPercentage: json["is_percentage"],
      );
}
