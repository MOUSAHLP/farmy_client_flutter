class TrackingModel {
  String? driverPhone;
  int? status;

  TrackingModel({this.driverPhone, this.status});

  TrackingModel.fromJson(Map<String, dynamic> json) {
    driverPhone = json['driver_phone'];
    status = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_phone'] = driverPhone;
    data['order_status'] = status;
    return data;
  }
}
