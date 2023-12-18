class CategoriesResponse {
  int id;
  String? name;
  String? imageUrl;
  CategoriesResponse({this.name, this.imageUrl, required this.id});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
        id: json["id"],
        imageUrl: json["image"] ?? "",
        name: json["name"] ?? "");
  }
  static List<CategoriesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => CategoriesResponse.fromJson(value)).toList();
  }
}
