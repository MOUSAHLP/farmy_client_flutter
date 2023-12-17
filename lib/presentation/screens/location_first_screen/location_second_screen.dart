import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/bloc/location_first_bloc/location_first_bloc.dart';
import 'package:pharma/bloc/location_first_bloc/location_first_event.dart';
import 'package:pharma/presentation/screens/location_first_screen/welcome_screen.dart';
import '../../../bloc/location_first_bloc/location_first_state.dart';
import '../../../core/app_enum.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_button.dart';

class LocationSecondScreen extends StatelessWidget {
  const LocationSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LocationFirstBloc>(
        create: (BuildContext context) =>
            sl<LocationFirstBloc>()..add(CurrentLocation()),
        child: const SelectLocationFromMapBody(),
      ),
    );
  }
}

class SelectLocationFromMapBody extends StatelessWidget {
  const SelectLocationFromMapBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<LocationFirstBloc, LocationFirstState>(
            listener: (context, state) {
              if (state is ExitLocation) {
                AppRouter.pop(context);
              }
            },
            builder: (context, state) {
              if (state.screenStates == ScreenStates.loading) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomAppBarScreen(
                          sectionName:
                          AppLocalizations.of(context)!.delivery_Address),
                      const SizedBox(height: 60),
                      const LinearProgressIndicator(
                        backgroundColor: ColorManager.primaryGreen,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "جاري تحديد موقعك ......",
                        style: getBoldStyle(color: ColorManager.primaryGreen, fontSize: 16),
                      )
                    ],
                  ),
                );
              }
              if (state.screenStates == ScreenStates.error) {
                return const Center(
                  child: Text("error"),
                );
              }
              return SafeArea(
                child: Stack(
                  children: [
                    GoogleMap(
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      markers: {
                        context.read<LocationFirstBloc>().markerLocation !,
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(state.latitude, state.longitude),
                        zoom: 18,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        context.read<LocationFirstBloc>().mapController = controller;
                        LatLng location = LatLng(state.latitude, state.longitude);
                        controller.animateCamera(
                            CameraUpdate.newLatLngZoom(location, 14));
                      },
                      onTap: (LatLng tappedLocation) {
                        context
                            .read<LocationFirstBloc>()
                            .add(ChangeLocationMarker(tappedLocation));
                      },
                    ),
                    CustomAppBarScreen(
                        sectionName:
                            AppLocalizations.of(context)!.delivery_Address),
                    Positioned(
                        top: 100,
                        right: 50,
                        left: 50,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.choose_the_Address,
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen, fontSize: 28),
                        ))),
                     Positioned(
                        bottom: 100,
                        right: 50,
                        left: 50,
                        child: Center(
                          child: CustomButton(label:AppLocalizations.of(context)!.confirm,onTap: (){
                       AppRouter.push(context, const WelcomeScreen());
                          }),
                        ))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
