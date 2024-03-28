import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../models/notification_model.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key,required this.notificationModel});
 final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [ColorManager.shadowGaryDown]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Expanded(
                  child: Text(notificationModel.data?.body??"",
                    style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),
                    textAlign: TextAlign.start,),
                ),
              ],

            ),
            Row(
mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(Formatter.formatDateOnly(context, notificationModel.createdAt)??"" ,style: getLightStyle(color:ColorManager.grayForMessage ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
