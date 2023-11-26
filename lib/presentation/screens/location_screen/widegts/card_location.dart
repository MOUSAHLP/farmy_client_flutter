import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key});

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 5),
      child: Container(
        width: 1.sw,
        
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.star,color: Colors.yellow,),
            const SizedBox(width: 3,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("دمر الجزيرة العاشرة - بناء 25 - الطابق 8",style:getBoldStyle(color:ColorManager.grayForMessage,fontSize: 14) ,maxLines: 2,overflow: TextOverflow.ellipsis),
                Text("مشروع دمر - دمشق - سورية",style:getBoldStyle(color:ColorManager.grayForSearchProduct,fontSize: 12) ,maxLines: 2,overflow: TextOverflow.ellipsis),
              ],),
            )
          ],
        )
      ),
    );
  }
}
