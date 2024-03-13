part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeData extends HomeEvent {}

class OnLoadingHomeData extends HomeEvent {}

class OnRefreshHomeData extends HomeEvent {}
