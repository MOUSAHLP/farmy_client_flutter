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
  OpeningTimes? openingTimes;


  Data({
    this.baseUrl,
    this.version,
    this.phone,
    this.showRewardSystem,
    this.openingTimes,

  });

  Data.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
    version = json['version'];
    phone = json['phone'];
    showRewardSystem = json['show_reward_system'];
    openingTimes= OpeningTimes.fromJson(json["opening_times"]);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['baseUrl'] = baseUrl;
    data['version'] = version;
    data['phone'] = phone;
    return data;
  }
}

class OpeningTimes {
  final String startTime;
  final String endTime;
  final String beforeMessage;
  final String afterMessage;

  OpeningTimes({
    required this.startTime,
    required this.endTime,
    required this.beforeMessage,
    required this.afterMessage,
  });


  factory OpeningTimes.fromJson(Map<String, dynamic> json) => OpeningTimes(
    startTime: json["start_time"],
    endTime: json["end_time"],
    beforeMessage: json["before_message"],
    afterMessage: json["after_message"],
  );
}
