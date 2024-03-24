import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/launcher.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/contact_us/widgets/custom_contact_continer.dart';

import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.contact_us),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Text(
                      AppLocalizations.of(context)!.leave_message_to_contact,
                      style: getUnderBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InputFieldAuth(
                      textAlign: TextAlign.start,
                      angelRadios: const Radius.circular(6),
                      color: const Color.fromRGBO(228, 228, 228, 1),
                      textStyle: getUnderBoldStyle(
                          color: ColorManager.grayForSearchProduct,
                          fontSize: FontSizeApp.s14)!,
                      width: 1.sw,
                      height: 44,
                      hintText: AppLocalizations.of(context)!.email_with_at,
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorManager.grayForSearchProduct,
                          fontSize: FontSizeApp.s14),
                      suffixIcon: const Text(" "),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InputFieldAuth(
                      maxLines: 5,
                      minLines: 5,
                      height: .30.sw,
                      width: 1.sw,
                      color: ColorManager.lightGray,
                      hintText: AppLocalizations.of(context)!
                          .write_message_notes_question_here,
                      hintStyle:
                          getRegularStyle(color: ColorManager.grayForMessage),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 139, vertical: 14),
                    child: CustomButton(
                      onTap: () {},
                      label: AppLocalizations.of(context)!.sent,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      AppLocalizations.of(context)!.you_can_connect_directly,
                      style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s15),

                    textAlign: TextAlign.center),
                  ),
                  Text(
                    AppLocalizations.of(context)!.on_the_next_number,
                    style: getBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s15),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: InkWell(
                      onTap: (){
                        launchPhoneCall("0962225868");
                      },
                      child: const CustomContactContainer(
                        contactImage: ImageManager.contactLogo,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or_via_whatsup,
                    style: getBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s15),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: InkWell(
                      onTap: (){
                        openWhatsApp("0962225868", context);
                      },
                      child: const CustomContactContainer(
                        contactImage: ImageManager.whatsUpLogo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
