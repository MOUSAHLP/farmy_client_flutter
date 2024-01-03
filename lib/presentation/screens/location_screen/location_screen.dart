import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_event.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/location_screen/add_location_screen.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/card_location.dart';
import 'package:pharma/presentation/screens/location_screen/select_location_from_map.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/search_address.dart';
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
      child: BlocConsumer<LocationBloc,LocationState>(
        listener: (context, state) {
        },
        bloc: sl<LocationBloc>()..add(GetUserAddress()),
        builder: (BuildContext context, state) { return LocationScreenBody(); },

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
        body: Stack(
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
                      const SearchAddress(),
                      InkWell(
                        onTap: (){
                          AppRouter.push(context,  AddLocationScreen());
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
                BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state){
              if(state.screenStates == ScreenStates.loading)
              {
                return const CircularProgressIndicator();
              }
              if(state.screenStates == ScreenStates.error)
              {
                return  Text("errr");
              }
              return Expanded(child: CustomOverscrollIndicator(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CardLocation(userAddressModel: state.userAddressList[index]),
                    itemCount:state.userAddressList.length,),
                  ));}
                )
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72,vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(label: AppLocalizations.of(context)!.add_new_favorite_address,onTap: (){
                      AppRouter.push(context, AddLocationScreen());
                    }),
                    const SizedBox(height: 16,),
                    CustomButton(label: AppLocalizations.of(context)!.done),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
