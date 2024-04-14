import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../bloc/location_bloc/location_event.dart';
import '../../../../models/user_address_response.dart';

class CardDeliveryAddresses extends StatelessWidget {
  const CardDeliveryAddresses({super.key, required this.userAddressModel});

  final UserAddressModel userAddressModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 14.w,
        end: 44.w,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                userAddressModel.isFavorite == "1" ? Icons.star : null,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<LocationBloc>().add(
                        SelectAddressDelivery(
                          userAddress: userAddressModel,
                        ),
                      );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userAddressModel.adress ?? "",
                      style: getBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: 14.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${userAddressModel.area ?? ""} - ${userAddressModel.street ?? ""} - ${userAddressModel.building ?? ""} - ${userAddressModel.floor ?? ""}",
                      style: getBoldStyle(
                        color: ColorManager.grayForSearchProduct,
                        fontSize: 12.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.read<LocationBloc>().add(
                      DeleteUserAddress(id: userAddressModel.id ?? 0),
                    );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 28.0.w,
                    height: 28.0.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-2, 3),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Colors.grey,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        10.0.r,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/x.svg",

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
