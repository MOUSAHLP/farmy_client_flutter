class ProductEditPrams{
  int id;
  int quantity;

  ProductEditPrams(this.id, this.quantity);
  static Map<String, dynamic> toJsonCard(
      ProductEditPrams productDetailsResponse) {
    return {
      "product_id": productDetailsResponse.id,
      "quantity": productDetailsResponse.quantity
    };
  }

  static List<Map<String, dynamic>> toJsonCardList(
      List<ProductEditPrams>? basketList) {
    return basketList == null
        ? []
        : basketList
        .map((value) => ProductEditPrams.toJsonCard(value))
        .toList();
  }
}