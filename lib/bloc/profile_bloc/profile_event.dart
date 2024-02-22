

abstract class ProfileEvent {
  ProfileEvent([List props = const []]) : super();
}
class UpdateProfile extends ProfileEvent {}

class GetImageGallery extends ProfileEvent {}
class EditBirthDay extends ProfileEvent{
  DateTime? birthDay;
  EditBirthDay({this.birthDay});
}