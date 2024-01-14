import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/location_screen/select_location_from_map.dart';
import 'package:pharma/presentation/screens/main_screen/main_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/location_bloc/location_bloc.dart';
import '../../../bloc/location_bloc/location_event.dart';
import '../../../bloc/location_bloc/location_state.dart';
import '../../../models/params/add_address_params.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class AddLocationScreen extends StatelessWidget {
  AddLocationScreen({super.key,this.isFirst=false});
bool isFirst;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: BlocConsumer<LocationBloc, LocationState>(
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
            AppRouter.push(context, const MainScreen());
          }
        },
        builder: (context, state) {
    AddAddressParams address = context.read<LocationBloc>().address;
    return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              CustomAppBarScreen(
                  sectionName:
                      AppLocalizations.of(context)!.favorite_addresses),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.choose_the_Address,
                          style: getBoldStyle(
                              color: ColorManager.grayForMessage, fontSize: 14),
                        ),
                      ],
                    ),
                    isFirst?const SizedBox():  InkWell(
                      onTap: () {
                        AppRouter.push(context, const SelectLocationFromMap());
                      },
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_on_rounded,
                              color: ColorManager.primaryGreen,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .map_to_choose_location,
                            style: getRegularStyle(
                                color: ColorManager.primaryGreen, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    InputFieldAuth(
                      color: ColorManager.grayForm,
                      width: 1.sw,
                      hintText:
                          AppLocalizations.of(context)!.area,
                      onChange: (value) {
                        address.name = value;
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.choose_the_Address,
                          style: getBoldStyle(
                              color: ColorManager.grayForMessage, fontSize: 14),
                        ),
                      ],
                    ),
                    InputFieldAuth(
                        color: ColorManager.grayForm,
                        width: 1.sw,
                        hintText: AppLocalizations.of(context)!.address,
                        onChange: (value) {
                          address.address = value;
                        }),
                    const SizedBox(
                      height: 9,
                    ),
                    InputFieldAuth(
                        color: ColorManager.grayForm,
                        width: 1.sw,
                        hintText: AppLocalizations.of(context)!.street,
                        onChange: (value) {
                          address.street = value;
                        }),
                    const SizedBox(
                      height: 9,
                    ),
                    InputFieldAuth(
                        color: ColorManager.grayForm,
                        width: 1.sw,
                        hintText: AppLocalizations.of(context)!.build,
                        onChange: (value) {
                          address.building = value;
                        }),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldAuth(
                              color: ColorManager.grayForm,
                              width: 1.sw,
                              hintText:
                                  AppLocalizations.of(context)!.entrance_number,
                              onChange: (value) {
                                address.buildingNumber = value;
                              }),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: InputFieldAuth(
                              color: ColorManager.grayForm,
                              width: 1.sw,
                              hintText: AppLocalizations.of(context)!.floor,
                              onChange: (value) {
                                address.floor = value;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    InputFieldAuth(
                      minLines: 5,
                      maxLines: 5,
                      height: 100,
                      color: ColorManager.grayForm,
                      width: 1.sw,
                      hintText: AppLocalizations.of(context)!.other_details,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: CustomButton(
                          label:
                              AppLocalizations.of(context)!.adding_the_address,
                          onTap: () {
                            context.read
                                <LocationBloc>()
                                .add(AddUserAddress(address: address));
                          }),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );}
      ),
    );
  }
}
