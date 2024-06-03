

class BuyCouponModel {
  final String status;
  final String message;
  final int statusCode;

  BuyCouponModel({
    required this.status,
    required this.message,
    required this.statusCode,
  });

  factory BuyCouponModel.fromJson(Map<String, dynamic> json) => BuyCouponModel(
    status: json["status"],
    message: json["message"],
    statusCode: json["statusCode"],
  );


}

class Data {
  final int userId;
  final int couponId;
  final String couponCode;
  final dynamic usedAt;
  final DateTime expireAt;
  final int id;

  Data({
    required this.userId,
    required this.couponId,
    required this.couponCode,
    required this.usedAt,
    required this.expireAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    couponId: json["coupon_id"],
    couponCode: json["coupon_code"],
    usedAt: json["used_at"],
    expireAt: DateTime.parse(json["expire_at"]),
    id: json["id"],
  );




}
