class ApiConst {
  static const String baseUrl =
      "https://control.farmy.peaklink.site/public/api";

  ///Auth
  static const String login = "/auth/login";
  static const String logout = "/auth/logout";
  static const String generateOtp = "/auth/generate-otp";
  static const String verifyOtp = "/auth/verify-otp";
  static const String changePassword = "/auth/change-password";
  static const String resetPassword = "/change_password";

  static const String signUp = "/users";
  static const String updateProfile = "/update_profile";
  static const String profile = "/profile";
  static const String deleteAccount = "/delete_account";

  ///Categories
  static const String getAllCategories = "/categories";
  static String getSubCategories(int id) => "/categories/$id";
  //product
  static String getProductBySubCategoryId = "/products";
  static String getProductDetailsById(int id) => "/products/$id";

  //home
  static String getHomeData = "/home-page";
  static String search = "/search";
  static String getHomeDynamicData = "/home-page-dynamic";
  static String getHomeAllProductById(int id) => "/home-page-dynamic/$id";

  /// Setting
  static const String getSetting = "/settings";

  /// privacy
  static const String getPrivacy = "/policy";

  /// conditions
  static const String getConditions = "/conditions";

  /// faq_questions
  static const String getFaqQuestions = "/faq_questions";
  static const String getAbout = "/about_the_app";

  /// who_we_are
  static const String getWhoWeAre = "/who_we_are";
  static const String contactUs = "/contact_us";

  /// favorite
  static const String getFavorite = "/getFavorit";
  static const String addFavorite = "/addToFavorit";
  static const String removeFavorite = "/removeFromFavorit";

  //payment-process
  static String getPaymentDetails = "/payment-process";
  static String createOrders = "/orders";

  ///Address
  static const String getUserAddresses = "/user_addresses";
  static const String addUserAddresses = "/user_addresses";
  static String deleteUserAddresses(int id) => "/user_addresses/$id";
  static String makeAdressFavorite(int id) =>
      "/user_addresses/set-favourite/$id";

  ///my_order
  static const String getMyOrder = "/orders";
  static const String getMyOrderHistory = "/history-orders";
  static String getDetailsOrder(int id) => "/orders/order-details/$id";
  static String deleteOrder(int id) => "/orders/$id";
  static String showBasket = "/get-cart-products-info";
  static String showRate = "/get-rates";
  static String rateAttribute = "/get-order-rate-attributes";
  static String submitRate(int id) => "/orders/update-rate/$id";

  /// track order
  static String getTrackOrderDetails(int id) => "/orders/order-status/$id";
  static String getOrderVerifyCode(int id) => "/displyCodeExists/$id";

  ///notification
  static  String getNotifications(int type) => "/notifications?type=$type";
  static  String deleteNotifications(int id) => "/notifications/$id";

  /// Rewards
  static const String getAllRewards = "/rewards";
  static const String getRewardsGuide = "/reward/guide/rewards";
  static const String getRewardsMemberShipGuide = "/reward/guide/memberships";
  static const String getRewardsPointHistoryExpired = "/reward/points/expired";
  static const String getRewardsPointHistoryUsed = "/reward/purchases";
  static const String getRewardsPointHistoryValid = "/reward/points/valid";
  static const String getRewardMyCoupons = "/reward/coupons";
  static const String getRewardActivityCoupons = "/reward/achievements/not-done";
  static const String getRewardsRankUser = "/reward/user-statistics";
  static const String getRewardsOfferCoupon = "/reward/coupons/offers";
  static const String buyCoupon = "/reward/coupons/buy";


  ///setting
  static const String getJoinOurTeamJobs = "/join-our-team/jobs";
  static const String addJoinOurTeamJobs = "/join-our-team";
  static const String getInvoices = "/invoices/get_invoices";


}
