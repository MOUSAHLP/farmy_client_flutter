// class NotificationModel {
//
//   String? title;
//   String? body;
//
//
//   NotificationModel({
//
//     this.title,
//     this.body,
//
//   });
//
//   factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
//     title: json["title"],
//     body: json["body"],
//   );
//
//
//
// }
class NotificationModel {
  int id;
  String? type;
  int notifiableId;
  Data? data;
  DateTime? createdAt;

  NotificationModel({
   required this.id,
    this.type,
  required  this.notifiableId,
    this.data,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    type: json["type"],
    notifiableId: json["notifiable_id"],
    data: Data.fromJson(json["data"]),
    createdAt: DateTime.parse(json["created_at"]),
  );
  static List<NotificationModel> listFromJson( List<dynamic> json){
    return json.map((value) =>NotificationModel.fromJson(value) ).toList();
  }
}

class Data {
  String? title;
  String? body;

  Data({
    this.title,
    this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}