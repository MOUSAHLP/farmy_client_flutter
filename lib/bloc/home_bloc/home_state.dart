part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ScreenState? screenState;
  final HomeResponse? homeData;
  const HomeState({this.screenState = ScreenState.loading, this.homeData});

  HomeState copyWith({ScreenState? screenState, HomeResponse? homeData}) {
    return HomeState(
        screenState: screenState ?? this.screenState,
        homeData: homeData ?? this.homeData);
  }

  @override
  List<Object?> get props => [screenState, homeData];
}
