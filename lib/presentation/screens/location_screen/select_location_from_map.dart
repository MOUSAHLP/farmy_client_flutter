import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import '../../../bloc/location_bloc/location_bloc.dart';
import '../../../bloc/location_bloc/location_event.dart';
import '../../../bloc/location_bloc/location_state.dart';
import '../../../core/app_enum.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_button.dart';

class SelectLocationFromMap extends StatelessWidget {
  SelectLocationFromMap({super.key});

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<LocationBloc, LocationState>(
            bloc: sl<LocationBloc>()..add(CurrentLocation()),
            listener: (context, state) {
              if (state is ExitLocation) {
                AppRouter.pop(context);
              }
            },
            builder: (context, state) {
              if (state.screenStates == ScreenStates.loading) {
                return SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomAppBarScreen(
                          sectionName:
                              AppLocalizations.of(context)!.delivery_Address,
                        ),
                        SizedBox(height: 60.h),
                        const LinearProgressIndicator(
                          backgroundColor: ColorManager.primaryGreen,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          AppLocalizations.of(context)!.locating_your_position,
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                );
              }
              if (state.screenStates == ScreenStates.error) {
                return CustomErrorScreen(
                  onTap: () {},
                );
              }
              return SafeArea(
                child: Stack(
                  children: [
                    GoogleMap(
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      markers: {
                        context.read<LocationBloc>().markerLocation,
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(state.latitude, state.longitude),
                        zoom: 18,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        context.read<LocationBloc>().mapController = controller;
                        LatLng location =
                            LatLng(state.latitude, state.longitude);
                        controller.animateCamera(
                          CameraUpdate.newLatLngZoom(
                            location,
                            20,
                          ),
                        );
                      },
                      onTap: (LatLng tappedLocation) {
                        context
                            .read<LocationBloc>()
                            .add(ChangeLocationMarker(tappedLocation));
                        isSelected = true;
                      },
                    ),
                    CustomAppBarScreen(
                      sectionName:
                          AppLocalizations.of(context)!.delivery_Address,
                    ),
                    Positioned(
                      top: 100,
                      right: 50,
                      left: 50,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.choose_the_Address,
                          style: getBoldStyle(
                            color: ColorManager.primaryGreen,
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 50,
                      left: 50,
                      child: Center(
                        child: CustomButton(
                            label: AppLocalizations.of(context)!.locating,
                            onTap: () {
                              if (isSelected) {
                                AppRouter.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 1),
                                    content: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .pleas_selected_marker,
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
                            }),
                      ),
                    ),
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
