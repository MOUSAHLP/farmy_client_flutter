import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_event.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/delivery_addresses/widegts/card_delivery_addresses.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_address.dart';
import 'package:pharma/presentation/screens/location_screen/add_location_screen.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/card_location.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/search_address.dart';
import 'package:pharma/presentation/screens/location_screen/widegts/shimmer_card.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';
import '../../../core/app_enum.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../../widgets/over_scroll_indicator.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state.isLoadingDelete) {
            LoadingDialog().openDialog(context);
          } else {
            LoadingDialog().closeDialog(context);
          }
          if (state.errorDelete != '') {
            ErrorDialog.openDialog(context, state.errorDelete);
          }
          if (state.successDelete) {
            AppRouter.pop(context);
          }
          if (state.isLoadingFavorite) {
            LoadingDialog().openDialog(context);
          } else {
            LoadingDialog().closeDialog(context);
          }
          if (state.errorFavorite != '') {
            ErrorDialog.openDialog(context, state.errorFavorite);
          }
          if (state.successFavorite) {
            AppRouter.pop(context);
          }
        },
        bloc: sl<LocationBloc>()..add(GetUserAddress()),
        builder: (BuildContext context, state) {
          return const LocationScreenBody();
        },
      ),
    );
  }
}

class LocationScreenBody extends StatelessWidget {
  const LocationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.delivery_Address,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 14.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.main_address,
                          style: TextStyle(
                            fontSize: FontSizeApp.s13.sp,
                            color: ColorManager.grayForMessage,
                            fontWeight: FontWeight.w900,
                            fontFamily: "FrutigerLTArabic",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.h),
                  CustomDeliveryAddress(
                    userAddressModel:
                        context.read<LocationBloc>().state.addressCurrent,
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.favorite_address,
                          style: TextStyle(
                            fontSize: FontSizeApp.s13.sp,
                            color: ColorManager.grayForMessage,
                            fontWeight: FontWeight.w900,
                            fontFamily: "FrutigerLTArabic",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                if (state.screenStates == ScreenStates.loading) {
                  return const ShimmerCard();
                }
                if (state.screenStates == ScreenStates.error) {
                  return const Text("error");
                }
                return CustomOverscrollIndicator(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      sl<LocationBloc>().add(GetUserAddress());
                    },
                    child: ListView.separated(
                      itemBuilder: (context, index) => CardDeliveryAddresses(
                        userAddressModel: state.userAddressList[index],
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ),
                        child: const Divider(
                          color: Color(
                            0XFFD9D9D9,
                          ),
                        ),
                      ),
                      itemCount: state.userAddressList.length,
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    label: AppLocalizations.of(context)!.add_new_favorite_address,
                    onTap: () {
                      AppRouter.push(context, AddLocationScreen());
                    },
                    fillColor: Colors.white,
                    isFilled: true,
                    borderColor: ColorManager.primaryGreen,
                    labelColor: ColorManager.primaryGreen,
                  ),
                  SizedBox(height: 16.h),
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
