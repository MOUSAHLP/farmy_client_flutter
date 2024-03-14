abstract class HomeSectionAllProductsState {}

class HomeSectionAllProductsInit extends HomeSectionAllProductsState {}

class HomeSectionAllProductsSuccess extends HomeSectionAllProductsState {}

class HomeSectionAllProductsLoading extends HomeSectionAllProductsState {}

class HomeSectionAllProductsError extends HomeSectionAllProductsState {
  String error;
  HomeSectionAllProductsError(this.error);
}
