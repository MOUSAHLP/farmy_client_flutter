import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/params/join_team_params.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/join_our_team/widgets/custom_select_job_dialog.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/join_our_team_bloc/join_our_team_bloc.dart';
import '../../../bloc/join_our_team_bloc/join_our_team_event.dart';
import '../../../bloc/join_our_team_bloc/join_our_team_state.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_loading_widget.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class JoinOurTeamScreen extends StatelessWidget {
  const JoinOurTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JoinOurTeamBloc>(
        lazy: true,
        create: (context) =>
        sl<JoinOurTeamBloc>()
          ..add(GetJoinOurTeam()),
        child: JoinOurTeamBody());
  }
}

class JoinOurTeamBody extends StatelessWidget {
  JoinOurTeamBody({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  String x = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.join_our_team),
            Expanded(
              child: BlocConsumer<JoinOurTeamBloc, JoinOurTeamState>(
                listener: (context, state) {
                  if (state.isLoading) {
                    LoadingDialog().openDialog(context);
                  } else {
                    LoadingDialog().closeDialog(context);
                  }
                  if (state.error != '') {
                    ErrorDialog.openDialog(context, state.error);
                  }
                  if (state.success) {
                    AppRouter.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state.screenStates == ScreenStates.loading) {
                    return const CustomLoadingWidget();
                  }
                  if (state.screenStates == ScreenStates.error) {
                    return CustomErrorScreen(
                      onTap: () {
                        // context.read<JoinOurTeamBloc>().add(GetJoinOurTeam());
                      },
                    );
                  }
                  if (state.screenStates == ScreenStates.success) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 18.h,
                          bottom: 18.h,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: 10.w,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .join_Our_Team_Statment,
                                  style: getUnderBoldStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s14.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 27.h,
                                  horizontal: 20.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: -2,
                                      color: ColorManager.black.withOpacity(
                                        0.18,
                                      ),
                                    )
                                  ]),
                                  child: InputFieldAuth(
                                      width: 1.sw,
                                      hintText: AppLocalizations.of(context)!
                                          .full_name,
                                      controller: nameController,
                                      validator: (value) {
                                        return AppValidators.validateNameFields(
                                            context, nameController.text);
                                      }),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 5),
                                        blurRadius: 10,
                                        spreadRadius: -2,
                                        color: ColorManager.black
                                            .withOpacity(0.18))
                                  ]),
                                  child: InputFieldAuth(
                                    width: 1.sw,
                                    hintText: AppLocalizations.of(context)!
                                        .contact_Number,
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      return AppValidators.validatePhoneFields(
                                          context, phoneController.text);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 27.h,
                                  horizontal: 20.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 5),
                                        blurRadius: 10,
                                        spreadRadius: -2,
                                        color: ColorManager.black.withOpacity(
                                          0.18,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: InputFieldAuth(
                                    controller: jobController,
                                    width: 1.sw,
                                    readOnly: true,
                                    hintText: AppLocalizations.of(context)!
                                        .choose_The_Right_job_For_You,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return CustomSelectJobDialog(
                                              jobs: context
                                                  .read<JoinOurTeamBloc>()
                                                  .jobs
                                                  ?.data ??
                                                  [],
                                              onChanged: (value) {
                                                jobController.text = value!;
                                                AppRouter.pop(context);
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                          ImageManager.dropDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 222.h),
                                child: CustomButton(
                                  width: 249.w,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<JoinOurTeamBloc>().add(
                                        AddJoinOurTeam(
                                          joinTeamParams: JoinTeamParams(
                                            phone: phoneController.text,
                                            name: nameController.text,
                                            job: jobController.text,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  label: AppLocalizations.of(context)!.register,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text("");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
