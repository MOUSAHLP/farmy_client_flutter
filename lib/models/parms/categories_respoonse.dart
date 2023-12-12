class CategoriesResponse {
  String? name;
  String? imageUrl;
  CategoriesResponse({this.name, this.imageUrl});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
        imageUrl: json["image"] ?? "", name: json["name"] ?? "");
  }
  static List<CategoriesResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => CategoriesResponse.fromJson(value)).toList();
  }
}
