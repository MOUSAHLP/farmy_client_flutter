class SubCategoryResponse {
  int? id;
  String? subCategoryName;
  String? subCategoryImage;

  SubCategoryResponse({this.subCategoryName, this.subCategoryImage, this.id});
  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryResponse(
      id: json["id"],
      subCategoryName: json["name"],
      subCategoryImage: json["image"],
    );
  }
}
