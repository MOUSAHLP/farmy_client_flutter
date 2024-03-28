class ContactUsModel {
  final String status;
  final String message;
  final dynamic data;
  final int statusCode;

  ContactUsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
    statusCode: json["statusCode"],
  );
}
