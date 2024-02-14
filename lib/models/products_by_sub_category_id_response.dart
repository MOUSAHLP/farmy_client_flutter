class ProductsBySubCategoryIdResponse {
  int? id;
  String? nameOfProduct;
  String? price;
  String? quantity;
  String? availabilityOfProduct;
  String? sellerName;
  String? discount;

  String? discountStatus;
  String? discountValue;
  String? image;
  String? quntity;

  ProductsBySubCategoryIdResponse(
      {this.id,
      this.nameOfProduct,
      this.price,
      this.quantity,
      this.availabilityOfProduct,
      this.quntity,
      this.discountStatus,
      this.discountValue,
      this.image,
      this.sellerName,
      this.discount});

  factory ProductsBySubCategoryIdResponse.fromJson(Map<String, dynamic> json) {
    return json["availability"] == "1"
        ? ProductsBySubCategoryIdResponse(
            id: json["id"],
            availabilityOfProduct: json["availability"],
            discountStatus: json["discount_status"],
            discount: json["discount_status"] != 0
                ? getDiscountedPrice(json["price"], json["discount"])
                : json["discount"],
            discountValue: json["discount"],
            nameOfProduct: json["name"],
            price: json["price"],
            quantity: json["quantity"],
            image: json["image"],
            sellerName: json["seller"] == null ? null : json["seller"]["name"])
        : ProductsBySubCategoryIdResponse();
  }

  static String getDiscountedPrice(String price, String discount) {
    int originalPrice = int.parse(price);
    int discountPrcie = int.parse(discount);

    int percantge = (((discountPrcie * 100) / originalPrice)).round();

    return percantge.toString();
  }

  static List<ProductsBySubCategoryIdResponse> listFromJson(
      List<dynamic>? json) {
    return json == null
        ? []
        : json
            .map((value) => ProductsBySubCategoryIdResponse.fromJson(value))
            .toList();
  }

  factory ProductsBySubCategoryIdResponse.init() {
    return ProductsBySubCategoryIdResponse(discountValue: "");
  }
}
