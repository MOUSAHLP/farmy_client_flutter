
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileInit extends ProfileState {}
class ProfileSuccessUpdate extends ProfileState {}
class ProfileError extends ProfileState {
  String error;
  ProfileError(this.error);
}
class ImageSuccess extends ProfileState{}
class EditBirthDayState extends ProfileState{

  EditBirthDayState();
}

