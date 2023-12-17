class ApiConst {
  static const String baseUrl =
      "https://control.farmy.peaklink.site/public/api";
  static const String getAllCategoties = "/categories";
  static String getSubCategories(int id) => "/categories/$id";
}
