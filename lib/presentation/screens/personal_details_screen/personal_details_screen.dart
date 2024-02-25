import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/personal_details_screen/widgets/shimmer_profile.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../bloc/profile_bloc/pofile_bloc.dart';
import '../../../bloc/profile_bloc/profile_event.dart';
import '../../../bloc/profile_bloc/profile_state.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/data_resource/local_resource/data_store.dart';
import '../../resources/assets_manager.dart';
import '../../widgets/custom_error_screen.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => sl<ProfileBloc>(),
      child: const EditProfileBody(),
    );
  }
}

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("DataStore.instance.userInfo?.birthday");
    print(DataStore.instance.userInfo?.birthday);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomAppBarScreen(
                  sectionName: AppLocalizations.of(context)!.personal_Details),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const BuildShimmerProfile();
                  } else if (state is ProfileError) {
                    return CustomErrorScreen(
                      onTap: () {
                        context.read<ProfileBloc>().add(UpdateProfile());
                      },
                      titleError: state.error,
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: InputFieldAuth(
                                    controller: context
                                        .read<ProfileBloc>()
                                        .fNameController,
                                    color: ColorManager.grayForm,
                                    width: 1.sw,
                                    hintText:
                                        AppLocalizations.of(context)!.fName,
                                    validator: (value) {
                                      return AppValidators
                                          .validateFirstNameFields(
                                              context, value);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: InputFieldAuth(
                                    controller: context
                                        .read<ProfileBloc>()
                                        .lNameController,
                                    color: ColorManager.grayForm,
                                    width: 1.sw,
                                    hintText:
                                        AppLocalizations.of(context)!.lName,
                                    validator: (value) {
                                      return AppValidators
                                          .validateLastNameFields(
                                              context, value);
                                    },
                                    // readOnly:
                                    //     !context.read<ProfileBloc>().isEditing,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.birthday,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) => InkWell(
                                onTap: () async {
                                  DateTime? selectedTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(
                                        DateTime.now().year,
                                        1,
                                        1,
                                      ),
                                      firstDate: DateTime.now().subtract(
                                          const Duration(days: 365000)),
                                      lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                            data: Theme.of(context).copyWith(
                                                colorScheme:
                                                    const ColorScheme.light(
                                              primary:
                                                  ColorManager.primaryGreen,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            )),
                                            child: child!);
                                      });
                                  if (selectedTime != null) {
                                    context.read<ProfileBloc>().add(
                                        EditBirthDay(birthDay: selectedTime));
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.0),
                                            child: context
                                                        .read<ProfileBloc>()
                                                        .birthday !=
                                                    null
                                                ? Text(
                                                    context
                                                        .read<ProfileBloc>()
                                                        .birthday!
                                                        .day
                                                        .toString(),
                                                    style: getRegularStyle(
                                                        color: ColorManager
                                                            .primaryGreen),
                                                  )
                                                : Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .today,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                          ))),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.0),
                                            child: context
                                                        .read<ProfileBloc>()
                                                        .birthday !=
                                                    null
                                                ? Text(
                                                    context
                                                        .read<ProfileBloc>()
                                                        .birthday!
                                                        .month
                                                        .toString(),
                                                    style: getRegularStyle(
                                                        color: ColorManager
                                                            .primaryGreen),
                                                  )
                                                : Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .month,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                          ))),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.0),
                                            child: context
                                                        .read<ProfileBloc>()
                                                        .birthday !=
                                                    null
                                                ? Text(
                                                    context
                                                        .read<ProfileBloc>()
                                                        .birthday!
                                                        .year
                                                        .toString(),
                                                    style: getRegularStyle(
                                                        color: ColorManager
                                                            .primaryGreen),
                                                  )
                                                : Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .year,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.phone,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            InputFieldAuth(
                                readOnly: true,
                                controller:
                                    context.read<ProfileBloc>().phoneController,
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.phone,
                                isPhone: true,
                                icon: Image.asset(
                                  ImageManager.flagOfSyria,
                                  height: 20,
                                  width: 20,
                                )),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.email_option,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
//email_option
                            InputFieldAuth(
                              controller:
                                  context.read<ProfileBloc>().emailController,
                              color: ColorManager.grayForm,
                              width: 1.sw,
                              hintText:
                                  AppLocalizations.of(context)!.email_with_at,
                              // readOnly: !context.read<ProfileBloc>().isEditing,
                            ),
                            const SizedBox(height: 120),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomButton(
                                      label: AppLocalizations.of(context)!
                                          .change_Number,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Material(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .change_Number,
                                                          style: getBoldStyle(
                                                              color: ColorManager
                                                                  .grayForMessage,
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 27),
                                                      child: InputFieldAuth(
                                                          color: ColorManager
                                                              .grayForm,
                                                          width: 1.sw,
                                                          hintText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .phone,
                                                          suffixIcon:
                                                              const CountryCodePicker(
                                                            showCountryOnly:
                                                                true,
                                                            flagWidth: 20,
                                                            enabled: false,
                                                            initialSelection:
                                                                'SY',
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: CustomButton(
                                                              label: AppLocalizations
                                                                      .of(context)!
                                                                  .confirm,
                                                              fillColor:
                                                                  ColorManager
                                                                      .primaryGreen,
                                                              onTap: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Material(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              vertical: 10),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    AppLocalizations.of(context)!.confirmNumber,
                                                                                    style: getBoldStyle(color: ColorManager.grayForMessage, fontSize: 15),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: 20),
                                                                                child: PinFieldAutoFill(
                                                                                  decoration: BoxLooseDecoration(
                                                                                    strokeColorBuilder: const FixedColorBuilder(
                                                                                      ColorManager.grayForm,
                                                                                    ),
                                                                                    bgColorBuilder: const FixedColorBuilder(
                                                                                      ColorManager.grayForm,
                                                                                    ),
                                                                                    textStyle: const TextStyle(fontSize: 20, color: ColorManager.primaryGreen),
                                                                                  ),
                                                                                  //   currentCode: textEditingController.text,
                                                                                  codeLength: 6,
                                                                                  onCodeChanged: (String? code) {},
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                child: Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: CustomButton(
                                                                                        label: AppLocalizations.of(context)!.confirm,
                                                                                        fillColor: ColorManager.primaryGreen,
                                                                                        onTap: () {},
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 28,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: CustomButton(
                                                                                        label: AppLocalizations.of(context)!.back,
                                                                                        fillColor: Colors.white,
                                                                                        onTap: () {
                                                                                          AppRouter.pop(context);
                                                                                        },
                                                                                        isFilled: true,
                                                                                        labelColor: ColorManager.primaryGreen,
                                                                                        borderColor: ColorManager.primaryGreen,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 28,
                                                          ),
                                                          Expanded(
                                                            child: CustomButton(
                                                              label: AppLocalizations
                                                                      .of(context)!
                                                                  .back,
                                                              fillColor:
                                                                  Colors.white,
                                                              onTap: () {
                                                                AppRouter.pop(
                                                                    context);
                                                              },
                                                              isFilled: true,
                                                              labelColor:
                                                                  ColorManager
                                                                      .primaryGreen,
                                                              borderColor:
                                                                  ColorManager
                                                                      .primaryGreen,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomButton(
                                    label: AppLocalizations.of(context)!
                                        .save_Changes,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ProfileBloc>()
                                            .add(UpdateProfile());
                                      }
                                    },
                                    fillColor: Colors.white,
                                    borderColor: ColorManager.primaryGreen,
                                    labelColor: ColorManager.primaryGreen,
                                    isFilled: true,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
