class RewardsUsedPointsModel {
  final String status;
  final String message;
  final List<Datum> data;
  final int statusCode;

  RewardsUsedPointsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RewardsUsedPointsModel.fromJson(Map<String, dynamic> json) => RewardsUsedPointsModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    statusCode: json["statusCode"],
  );


}

class Datum {
  final int id;
  final int points;
  final User user;
  final Coupon coupon;

  Datum({
    required this.id,
    required this.points,
    required this.user,
    required this.coupon,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    points: json["points"],
    user: User.fromJson(json["user"]),
    coupon: Coupon.fromJson(json["coupon"]),
  );


}

class Coupon {
  final int id;
  final int value;
  final dynamic price;
  final CouponType couponType;
  final String description;
  final DateTime createdAt;

  Coupon({
    required this.id,
    required this.value,
    required this.price,
    required this.couponType,
    required this.description,
    required this.createdAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["id"],
    value: json["value"],
    price: json["price"],
    couponType: CouponType.fromJson(json["coupon_type"]),
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
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

class User {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String email;
  final dynamic address;
  final String phone;
  final String roleId;
  final dynamic latitude;
  final dynamic longitude;
  final String status;
  final dynamic fcmToken;
  final dynamic cityId;
  final dynamic deleteReason;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.email,
    required this.address,
    required this.phone,
    required this.roleId,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.fcmToken,
    required this.cityId,
    required this.deleteReason,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    birthday: DateTime.parse(json["birthday"]),
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    roleId: json["role_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    fcmToken: json["fcm_token"],
    cityId: json["city_id"],
    deleteReason: json["delete_reason"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
