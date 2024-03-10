import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../bloc/location_bloc/location_event.dart';
import '../../../../models/user_address_response.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key,required this.userAddressModel});
 final UserAddressModel userAddressModel;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 5),
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
                child: const Icon(Icons.star,color: Colors.yellow,)),
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
                  Text(userAddressModel.name??"",style:getBoldStyle(color:ColorManager.grayForMessage,fontSize: 14) ,maxLines: 2,overflow: TextOverflow.ellipsis),
                  Text("${userAddressModel.area??""} - ${userAddressModel.street??""} - ${userAddressModel.building??""} - ${userAddressModel.floor??""}",style:getBoldStyle(color:ColorManager.grayForSearchProduct,fontSize: 12) ,maxLines: 2,overflow: TextOverflow.ellipsis),
                ],),
              ),
            ),
            InkWell(
                onTap: (){
                  context.read<LocationBloc>().add(DeleteUserAddress(id: userAddressModel.id??0));
                },
                child: const Icon(Icons.clear,color: Colors.red,)),
          ],
        )
      ),
    );
  }
}
