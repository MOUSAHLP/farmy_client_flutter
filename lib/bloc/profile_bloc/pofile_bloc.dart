import 'dart:io';

import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/profile_bloc/profile_event.dart';
import 'package:pharma/bloc/profile_bloc/profile_state.dart';
import 'package:pharma/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/services_locator.dart';
import '../../data/data_resource/local_resource/data_store.dart';
import '../../data/repository/user_repository.dart';
import '../../models/profile_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileModel profileModel = ProfileModel();
  TextEditingController fNameController =
      TextEditingController(text: DataStore.instance.userInfo?.firstName);
  TextEditingController lNameController =
      TextEditingController(text: DataStore.instance.userInfo?.lastName);
  TextEditingController phoneController =
      TextEditingController(text: DataStore.instance.userInfo?.phone);
  TextEditingController emailController =
      TextEditingController(text: DataStore.instance.userInfo?.email);

  DateTime? birthday=DataStore.instance.userInfo?.birthday;
  File? imagePick;

  ProfileBloc() : super(ProfileInit()) {
    on<ProfileEvent>((event, emit) async {
      print("DataStore.instance.userInfo?.birthday");
      print(DataStore.instance.userInfo?.birthday);
      if (event is UpdateProfile) {
        emit(ProfileLoading());
        profileModel.fName = fNameController.text;
        profileModel.lName = lNameController.text;
        profileModel.email = emailController.text;
        profileModel.phone = phoneController.text;
        profileModel.birthday = birthday;

        var response = await UserRepository.editProfile(profileModel);
        response.fold((l) {
          emit(ProfileError(l));
        }, (r) {
          LoginResponse result = LoginResponse(
            id: r.id ?? DataStore.instance.userInfo!.id,
            firstName: r.firstName??"",
            phone: r.phone??"",
            email: r.email??"",
            lastName: r.lastName??"",
            birthday:r. birthday
          );
          DataStore.instance.userInfo?.birthday=r.birthday;
          sl<AuthenticationBloc>().loginResponse = result;
          DataStore.instance.setUserInfo(result);
          emit(ProfileSuccessUpdate());
        });
      }


      if (event is EditBirthDay) {
        birthday = event.birthDay;
        emit(EditBirthDayState());
      }
    });
  }
}
