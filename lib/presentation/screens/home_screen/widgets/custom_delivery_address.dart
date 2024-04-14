import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/translations.dart';

import '../../../../bloc/location_bloc/location_bloc.dart';
import '../../../../models/user_address_response.dart';
import '../../../resources/assets_manager.dart';

class CustomDeliveryAddress extends StatelessWidget {
  final UserAddressModel? userAddressModel;

  const CustomDeliveryAddress({
    super.key,
    required this.userAddressModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 13.w,
        end: 13.w,
      ),
      child: InkWell(
        onTap: () {
          AppRouter.push(context, const LocationScreen());
        },
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0.r,
              ),
              border: const Border(
                left: BorderSide(
                  color: ColorManager.grayForMessage,
                ),
                right: BorderSide(
                  color: ColorManager.grayForMessage,
                ),
                top: BorderSide(
                  color: ColorManager.grayForMessage,
                ), // White border at the top
                bottom: BorderSide(
                  color: ColorManager.grayForMessage,
                ), // White border at the bottom
              ),
            ),
            height: 61.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 21.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageManager.location,
                    height: 25.h,
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.delivery_to,
                              style: getSemiBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s10,
                              )!
                                  .copyWith(height: 1),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                getAddress(userAddressModel!),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getBoldStyle(
                                  fontSize: FontSizeApp.s13,
                                  color: ColorManager.primaryGreen,
                                )!
                                    .copyWith(height: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: ColorManager.grayForMessage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getAddress(UserAddressModel userAddressModel) {
    final address = userAddressModel.adress;
    final area = userAddressModel.area;
    final street = userAddressModel.street;
    final building = userAddressModel.building;
    final floor = userAddressModel.floor;

    final addressPart = address != null ? "$address - " : "";
    final areaPart = area != null ? "$area - " : "";
    final streetPart = street != null ? "$street - " : "";
    final buildingPart = building != null ? "$building - " : "";
    final floorPart = floor != null ? "$floor " : "";

    return "$addressPart$areaPart$streetPart$buildingPart$floorPart"
        .trimRight();
  }
}
