abstract class HomeSectionAllProductsEvent {}

class GetHomeSectionAllProducts extends HomeSectionAllProductsEvent {
  final int id;
  GetHomeSectionAllProducts({required this.id});
}
