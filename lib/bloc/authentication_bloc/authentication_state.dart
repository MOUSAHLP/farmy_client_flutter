import 'package:equatable/equatable.dart';


class AuthenticationState extends Equatable {
  int indexTap;
  AuthenticationState({this.indexTap = 0});
  AuthenticationState copyWith({
    int?index}) {
    return AuthenticationState(indexTap: index??indexTap);
  }
  @override
  List<Object> get props => [
    identityHashCode(this),
    indexTap];
}
