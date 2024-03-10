class SettingModel {
  String? status;
  String? message;
  Data? data;

  SettingModel({this.status, this.message, this.data});

  SettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? baseUrl;
  String? version;
  String? phone;
  bool? showRewardSystem;

  Data({this.baseUrl, this.version, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
    version = json['version'];
    phone = json['phone'];
    showRewardSystem = json["show_reward_system"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['baseUrl'] = baseUrl;
    data['version'] = version;
    data['phone'] = phone;
    return data;
  }
}
