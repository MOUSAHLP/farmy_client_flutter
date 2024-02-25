class WhoWeAreModel {
  String? status;
  String? message;
  Data? data;

  WhoWeAreModel({this.status, this.message, this.data});

  WhoWeAreModel.fromJson(Map<String, dynamic> json) {
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
  String? html;

  Data({this.html});

  Data.fromJson(Map<String, dynamic> json) {
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['html'] = html;
    return data;
  }
}
