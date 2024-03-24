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
  final int value;
  final int price;
  final CouponType couponType;
  final String couponCode;
  final String description;
  final DateTime createdAt;
  final DateTime expireAt;

  Datum({
    required this.id,
    required this.value,
    required this.price,
    required this.couponType,
    required this.couponCode,
    required this.description,
    required this.createdAt,
    required this.expireAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        value: json["value"],
        price: json["price"],
        couponType: CouponType.fromJson(json["coupon_type"]),
        couponCode: json["coupon_code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        expireAt: DateTime.parse(json["expire_at"]),
      );
}

class CouponType {
  final int id;
  final String name;
  final String image;
  final String type;

  CouponType({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory CouponType.fromJson(Map<String, dynamic> json) => CouponType(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        type: json["type"],
      );
}
