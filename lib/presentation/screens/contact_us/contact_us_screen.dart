import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/app_validators.dart';
import 'package:pharma/core/launcher.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/contact_us/widgets/custom_contact_continer.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/translations.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (BuildContext context) => sl<ContactUsBloc>(),
      child: BlocConsumer<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state.isSuccess) {
            LoadingDialog().closeDialog(context);
            AppRouter.pop(context);
          }
          if (state.isLoading) {
            LoadingDialog().openDialog(context);
          }
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                CustomAppBarScreen(
                  sectionName: AppLocalizations.of(context)!.contact_us,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 29.w,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .leave_message_to_contact,
                            style: getUnderBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: InputFieldAuth(
                            textDirection: TextDirection.ltr,
                            controller: emailController,
                            textAlign: TextAlign.start,
                            angelRadios: Radius.circular(
                              6.r,
                            ),
                            color: const Color.fromRGBO(228, 228, 228, 1),
                            textStyle: getUnderBoldStyle(
                                color: ColorManager.grayForSearchProduct,
                                fontSize: FontSizeApp.s14)!,
                            width: 1.sw,
                            height: 44.h,
                            hintText:
                                AppLocalizations.of(context)!.email_with_at,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorManager.grayForSearchProduct,
                              fontSize: FontSizeApp.s14.sp,
                            ),
                            suffixIcon: const Text(" "),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: InputFieldAuth(
                            textDirection: TextDirection.ltr,
                            controller: notesController,
                            maxLines: 5,
                            minLines: 5,
                            height: .30.sw,
                            width: 1.sw,
                            color: ColorManager.lightGray,
                            hintText: AppLocalizations.of(context)!
                                .write_message_notes_question_here,
                            hintStyle: getRegularStyle(
                              color: ColorManager.grayForMessage,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 139.w,
                            vertical: 14.h,
                          ),
                          child: CustomButton(
                            onTap: () {
                              if (AppValidators.validateEmailFields(
                                      context, emailController.text) ==
                                  null) {
                                context.read<ContactUsBloc>().add(
                                      SentInfo(
                                        email: emailController.text,
                                        notes: notesController.text,
                                      ),
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 1),
                                    content: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        state.isError.isEmpty
                                            ? "!!! Error \nPlease Enter Email"
                                            : state.isError,
                                        style: getRegularStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSizeApp.s14,
                                        ),
                                      ),
                                    ),
                                    backgroundColor: ColorManager.primaryGreen,
                                  ),
                                );
                              }
                            },
                            label: AppLocalizations.of(context)!.sent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 10.w,
                            end: 10.w,
                            top: 15.h,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .you_can_connect_directly,
                            style: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Text(
                        //   AppLocalizations.of(context)!.on_the_next_number,
                        //   style: getBoldStyle(
                        //     color: ColorManager.grayForMessage,
                        //     fontSize: FontSizeApp.s15.sp,
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                          ),
                          child: InkWell(
                            onTap: () {
                              launchPhoneCall("0962225868");
                            },
                            child: const CustomContactContainer(
                              contactImage: ImageManager.contactLogo,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
