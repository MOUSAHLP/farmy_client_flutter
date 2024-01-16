class ApiConst {
  static const String baseUrl =
      "https://control.farmy.peaklink.site/public/api";

  ///Auth
  static const String login = "/auth/login";
  static const String logout = "/auth/logout";
  static const String generateOtp = "/auth/generate-otp";
  static const String verifyOtp = "/auth/verify-otp";
  static const String changePassword = "/auth/change-password";

  static const String signUp = "/users";
  static const String updateProfile = "";
  static const String profile = "";

  ///Categories
  static const String getAllCategoties = "/categories";
  static String getSubCategories(int id) => "/categories/$id";
//product
  static String getProductBySubCategoryId = "/products";
  static String getProductDetailsById(int id) => "/products/$id";

  //home
  static String getHomeDate = "/home-page";

  //payment-process
  static String getPaymentDetails = "/payment-process";

  ///Address
  static const String getUserAddresses = "/user_addresses";
  static const String addUserAddresses = "/user_addresses";
  static  String deleteUserAddresses(int id) => "/user_addresses/$id";

  ///my_order
  static const String getMyOrder = "/orders";
}
