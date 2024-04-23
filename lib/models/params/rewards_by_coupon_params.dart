class BuyCouponParams {
  int? id;


  BuyCouponParams({this.id,});

  Map<String, dynamic> toJson() => {
    "coupon_id": id,

  };
}
