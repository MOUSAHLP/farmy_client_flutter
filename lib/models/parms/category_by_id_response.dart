import 'package:pharma/models/parms/sub_category_response.dart';

class CategoryByIdResponse {
  String? categoryName;
  String? categoryImage;
  List<SubCategoryResponse>? subCategoryList;
  CategoryByIdResponse(
      {this.categoryName, this.categoryImage, this.subCategoryList});
  factory CategoryByIdResponse.fromJson(Map<String, dynamic> json) {
    return CategoryByIdResponse(
        categoryName: json["name"],
        categoryImage: json["image"],
        subCategoryList: json["subcategories"] == null
            ? []
            : List<SubCategoryResponse>.from(json["subcategories"]
                .map((x) => SubCategoryResponse.fromJson(x))));
  }
}
