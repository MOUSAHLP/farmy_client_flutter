part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeData extends HomeEvent {}

/// Ghina Change
class GetHomeEndpoints extends HomeEvent {}
class GetCategory extends HomeEvent {}
class GetBanner extends HomeEvent {}
class GetProduct extends HomeEvent {}
