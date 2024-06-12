import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/notification_bloc/notification_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../bloc/notification_bloc/notification_event.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../models/notification_model.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class CardNotification extends StatelessWidget {
  CardNotification({Key? key, required this.notificationModel})
      : super(key: key);

  final NotificationModel notificationModel;

  final SlidableController _slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return
    Slidable(
      controller: _slidableController,
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            context
                .read<NotificationBloc>()
                .add(DeleteNotification(notificationModel.id));
          },
        ),
      ],
      child: buildCard(context),
    );
  }

  Widget buildCard(context) {
    return Container(
      alignment: Alignment.center,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: Colors.white,
        boxShadow: [ColorManager.shadowGaryDown],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    notificationModel.data?.body ?? "",
                    style: getBoldStyle(
                        color: ColorManager.grayForMessage, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Formatter.formatDateOnly(
                          context, notificationModel.createdAt) ??
                      "",
                  style: getLightStyle(color: ColorManager.grayForMessage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
