import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/location_screen/select_location_from_map.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

import '../../../core/app_enum.dart';

class LocationFavoriteScreen extends StatelessWidget {
   LocationFavoriteScreen({super.key});
  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

          child: Column(children: [
            CustomAppBarScreen(sectionName: AppLocalizations.of(context)!.delivery_Address),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.choose_the_Address,style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),),
                    ],
                  ),
                  GooglePlacesAutoCompleteTextFormField(
                    textEditingController: destinationController,
                    googleAPIKey: mapKey,
                    debounceTime: 400,
                    countries: const ["sy"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (prediction) {
                      destinationController.text=prediction.description!;
                    },
                    itmClick: (prediction) {
                      destinationController.text = prediction.description!;
                       destinationController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                    },decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.please_select_the_desired_delivery_address,
                    hintStyle: getRegularStyle(color: ColorManager.grayForSearchProduct,fontSize: 14),
                  ),
                    style: getRegularStyle(color: Colors.black),
                  ),
                  InkWell(
                    onTap: (){
                      AppRouter.push(context, const SelectLocationFromMap());
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on_rounded,color: ColorManager.primaryGreen,),
                        ),

                        Text(AppLocalizations.of(context)!.map_to_choose_location,style: getRegularStyle(color: ColorManager.primaryGreen,fontSize: 14),)
                      ],
                    ),
                  ),
                  InputFieldAuth(
                    color: ColorManager.grayForm,
                    width: 1.sw,
                    hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                  ),
                    SizedBox(
                      height: 14,
                    )
                    ,Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.choose_the_Address,style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),),
                    ],
                  ),
                  InputFieldAuth(
                    color: ColorManager.grayForm,
                    width: 1.sw,
                    hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  InputFieldAuth(
                    color: ColorManager.grayForm,
                    width: 1.sw,
                    hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  InputFieldAuth(
                    color: ColorManager.grayForm,
                    width: 1.sw,
                    hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFieldAuth(
                          color: ColorManager.grayForm,
                          width: 1.sw,
                          hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                        ),
                      ),
                      SizedBox(width: 13,),
                      Expanded(
                        child: InputFieldAuth(
                          color: ColorManager.grayForm,
                          width: 1.sw,
                          hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  InputFieldAuth(
                    minLines: 5,
                    maxLines: 5,
                    height: 100,
                    color: ColorManager.grayForm,
                    width: 1.sw,
                    hintText: "اختر اسم العنوان المفصل لديك     مثال (المنزل)",
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 62),
                    child: CustomButton(label: AppLocalizations.of(context)!.done),
                  ),
                ],
              ),
            ),


          ]),
        ),

      ),
    );
  }
}
