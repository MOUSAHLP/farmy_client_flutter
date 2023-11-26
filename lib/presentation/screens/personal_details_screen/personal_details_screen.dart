import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldAuth(
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.fName,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: InputFieldAuth(
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.lName,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppLocalizations.of(context)!.birthday,
                          style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldAuth(
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.today,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: InputFieldAuth(
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.month,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: InputFieldAuth(
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.year,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ Text(AppLocalizations.of(context)!.phone,
                        style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),)],
                    ),
                    const SizedBox(height: 15),
                    InputFieldAuth(
                        color: ColorManager.grayForm,
                        width: 1.sw,
                        hintText: AppLocalizations.of(context)!.phone,
                        suffixIcon: const CountryCodePicker(
                          showCountryOnly: true,
                          flagWidth: 20,
                          enabled: false,
                          initialSelection: 'SY',
                        )),
                    const SizedBox(height: 143),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(label: AppLocalizations.of(context)!.change_Number,
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                  Material(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    color: Colors.transparent,
                                  child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(AppLocalizations.of(context)!.change_Number,
                                              style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),),
                                          ],
                                        ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 27),
                                            child: InputFieldAuth(
                                                color: ColorManager.grayForm,
                                                width: 1.sw,
                                                hintText: AppLocalizations.of(context)!.phone,
                                                suffixIcon: const CountryCodePicker(
                                                  showCountryOnly: true,
                                                  flagWidth: 20,
                                                  enabled: false,
                                                  initialSelection: 'SY',
                                                )),
                                          ),
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    label:AppLocalizations.of(context)!.confirm,
                                                    fillColor: ColorManager.primaryGreen,
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title:
                                                            Material(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(25.0),
                                                              ),

                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Text("رمز التأكد من الرقم",
                                                                        style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                                                    child: PinFieldAutoFill(
                                                                      decoration: BoxLooseDecoration(
                                                                      strokeColorBuilder:  const FixedColorBuilder( ColorManager.grayForm,),
                                                                        bgColorBuilder:const FixedColorBuilder( ColorManager.grayForm,),
                                                                        textStyle:
                                                                        const TextStyle(fontSize: 20, color: ColorManager.primaryGreen),
                                                                      ),
                                                                      //   currentCode: textEditingController.text,
                                                                      codeLength: 6,
                                                                      onCodeChanged: (String? code) {

                                                                      },
                                                                    ),
                                                                  ),

                                                                  SizedBox(
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child: CustomButton(
                                                                            label:AppLocalizations.of(context)!.confirm,
                                                                            fillColor: ColorManager.primaryGreen,
                                                                            onTap: () {
                                                                            },
                                                                          ),
                                                                        ),
                                                                        const SizedBox(width: 5,),
                                                                        Expanded(
                                                                          child: CustomButton(
                                                                            label:AppLocalizations.of(context)!.back,
                                                                            fillColor: Colors.white,

                                                                            onTap: () {
                                                                            },
                                                                            isFilled: true,
                                                                            labelColor: ColorManager.primaryGreen,
                                                                            borderColor:ColorManager.primaryGreen,
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
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 5,),
                                                Expanded(
                                                  child: CustomButton(
                                                    label:AppLocalizations.of(context)!.back,
                                                    fillColor: Colors.white,

                                                    onTap: () {
                                                    },
                                                    isFilled: true,
                                                    labelColor: ColorManager.primaryGreen,
                                                    borderColor:ColorManager.primaryGreen,
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
                            onTap: () {},
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
            ),
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.personal_Details),
          ],
        ),
      ),
    );
  }
}
