import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_event.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/location_screen/location_favorite_screen.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/card_location.dart';
import 'package:pharma/presentation/screens/location_screen/select_location_from_map.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';
import '../../../core/app_enum.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/over_scroll_indicator.dart';
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LocationBloc>(
        create: (BuildContext context) =>
        sl<LocationBloc>()..add(Init()),
        child:  const LocationScreenBody(),
      ),
    );
  }
}

class LocationScreenBody extends StatelessWidget {
 const  LocationScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(children: [
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
                        textEditingController: context.read<LocationBloc>().destinationController,
                        googleAPIKey: mapKey,
                        debounceTime: 400,
                        countries: const ["sy"],
                        isLatLngRequired: true,
                        getPlaceDetailWithLatLng: (prediction) {
                          context.read<LocationBloc>(). destinationController.text=prediction.description!;
                        },
                        itmClick: (prediction) {
                          context.read<LocationBloc>().    destinationController.text = prediction.description!;
                          context.read<LocationBloc>().      destinationController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
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

                    ],
                  ),
                ),
                Expanded(child: CustomOverscrollIndicator(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>const CardLocation(),
                  itemCount: 5,),
                ))

              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72,vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(label: AppLocalizations.of(context)!.add_new_favorite_address,onTap: (){
                      AppRouter.push(context, LocationFavoriteScreen());
                    }),
                    const SizedBox(height: 16,),
                    CustomButton(label: AppLocalizations.of(context)!.done),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
