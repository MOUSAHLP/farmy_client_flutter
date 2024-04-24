import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../bloc/location_bloc/location_event.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../models/user_address_response.dart';
import '../../../../translations.dart';
import '../../../widgets/custom_button.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key,required this.userAddressModel});
 final UserAddressModel userAddressModel;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 17.w,vertical: 5.h),
      child: Container(
        width: 1.sw-50,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: (){

                },
                child:  Icon(userAddressModel.isFavorite=="1"?Icons.star:null,color: Colors.yellow,)),
            const SizedBox(width: 3,),
            Expanded(
              child: InkWell(
                onTap: ()
                {
                  context.read<LocationBloc>().add(SelectAddressDelivery(userAddress:userAddressModel ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(userAddressModel.area??"",style:getBoldStyle(color:ColorManager.grayForMessage,fontSize: 14) ,maxLines: 2,overflow: TextOverflow.ellipsis),
                  Text("${userAddressModel.street??""} - ${userAddressModel.building??""} - ${userAddressModel.floor??""}-${userAddressModel.name??""} ",style:getBoldStyle(color:ColorManager.grayForSearchProduct,fontSize: 12) ,maxLines: 2,overflow: TextOverflow.ellipsis),
                ],),
              ),
            ),
            InkWell(
                onTap: (){
      showDialog(
          context: context,
          builder: (BuildContext context) {  return AlertDialog(
                    title: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(context)!.delete_site,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: getBoldStyle(
                                        color: ColorManager.grayForMessage, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    label: AppLocalizations.of(context)!.confirm,
                                    fillColor: ColorManager.primaryGreen,
                                    onTap: () {
                                      context.read<LocationBloc>().add(DeleteUserAddress(id: userAddressModel.id??0));
                                      AppRouter.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    label: AppLocalizations.of(context)!.back,
                                    fillColor: Colors.white,
                                    onTap: () {
                                      AppRouter.pop(context);
                                    },
                                    isFilled: true,
                                    labelColor: ColorManager.primaryGreen,
                                    borderColor: ColorManager.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );});


                },
                child: const Icon(Icons.clear,color: Colors.red,)),
          ],
        )
      ),
    );
  }
}
