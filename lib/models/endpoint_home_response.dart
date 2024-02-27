class EndpointHomeResponse {
  String sectionName;
  String showMoreRoute;
  String endPoint;

  EndpointHomeResponse(
      {required this.sectionName,
      required this.showMoreRoute,
      required this.endPoint});

  factory EndpointHomeResponse.fromJson(Map<String, dynamic> json) {
    // todo Ghina : edit keys
    return EndpointHomeResponse(
        sectionName: json["id"],
        showMoreRoute: json["image"] ?? "",
        endPoint: json["name"] );
  }
  static List<EndpointHomeResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => EndpointHomeResponse.fromJson(value)).toList();
  }
}