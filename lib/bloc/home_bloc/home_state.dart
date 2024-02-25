part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ScreenState? screenState;
  final HomeResponse? homeData;
  final List<EndpointHomeResponse>? endpointHome;
  final List<CategoriesResponse>? categories;
  final List<ProductsBySubCategoryIdResponse>? products;
  final List<BannersResponse>? banners;

  const HomeState(
      {this.screenState = ScreenState.loading,
      this.endpointHome,
      this.products,
      this.categories,
      this.banners,
      this.homeData});

  HomeState copyWith(
      {ScreenState? screenState,
      HomeResponse? homeData,
      List<EndpointHomeResponse>? endpointHome,
      List<CategoriesResponse>? categories,
      List<ProductsBySubCategoryIdResponse>? products,
      List<BannersResponse>? banners}) {
    return HomeState(
      screenState: screenState ?? this.screenState,
      homeData: homeData ?? this.homeData,
      categories: categories ?? this.categories,
      endpointHome: endpointHome ?? this.endpointHome,
      products: products ?? this.products,
      banners: banners ?? this.banners,
    );
  }

  @override
  List<Object?> get props =>
      [screenState, homeData, endpointHome, products, banners, categories];
}
