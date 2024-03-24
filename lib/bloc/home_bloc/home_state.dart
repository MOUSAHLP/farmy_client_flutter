part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ScreenState? screenState;
  final HomeResponse? homeData;
  final List<EndpointHomeResponse>? endpointHome;
  final List<CategoriesResponse>? categories;
  final List<ProductResponse>? products;
  final List<BannersResponse>? banners;

  final String error;

  const HomeState(
      {this.screenState = ScreenState.loading,
      this.endpointHome,
      this.products,
      this.categories,
      this.banners,
      this.homeData,
      this.error = ''});

  HomeState copyWith({
    ScreenState? screenState,
    HomeResponse? homeData,
    List<EndpointHomeResponse>? endpointHome,
    List<CategoriesResponse>? categories,
    List<ProductResponse>? products,
    List<BannersResponse>? banners,
    String? error,
  }) {
    return HomeState(
        screenState: screenState ?? this.screenState,
        homeData: homeData ?? this.homeData,
        categories: categories ?? this.categories,
        endpointHome: endpointHome ?? this.endpointHome,
        products: products ?? this.products,
        banners: banners ?? this.banners,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [
        screenState,
        homeData,
        endpointHome,
        products,
        banners,
        categories,
        error
      ];
}
