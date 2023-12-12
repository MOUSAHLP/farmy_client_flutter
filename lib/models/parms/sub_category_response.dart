class SubCategoryResponse {
  String? subCategoryName;
  String? subCategoryImage;

  SubCategoryResponse({this.subCategoryName, this.subCategoryImage});
  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryResponse(
      subCategoryName: json["name"],
      subCategoryImage: json["image"],
    );
  }
}
