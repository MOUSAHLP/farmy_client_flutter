import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/notification_screen/widgets/card_notification.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/notification_bloc/notification_bloc.dart';
import '../../../bloc/notification_bloc/notification_event.dart';
import '../../../core/services/services_locator.dart';
import '../../resources/style_app.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        child: const NotificationScreenBody(),
        create: (context) => sl<NotificationBloc>());
  }
}
class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({super.key});

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody>     with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.notification),
            Expanded(
              child:
              sl<AuthenticationBloc>().loggedIn?
              Column(
                children: [
                  const SizedBox(height: 1,),
                  Container(
                    height: 50,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      boxShadow: [
                        ColorManager.shadowGaryDown,
                      ],
                    color: Colors.white,
                    ),
                    child: TabBar(
                      controller: context.read<NotificationBloc>().tabController,
                      tabs: [
                        Tab(
                          child: FittedBox(child: Text(AppLocalizations.of(context)!.offers_Notifications)),
                        ),
                        Tab(
                          child: FittedBox(child: Text(AppLocalizations.of(context)!.app_Notifications)),
                        ),

                      ],
                      unselectedLabelColor:ColorManager.grayForMessage,
                      labelColor: ColorManager.primaryGreen,
                      onTap: (v) {
                        context.read<NotificationBloc>().add(TapOnPressedNotification(v));
                      },
                      labelStyle: getBoldStyle(color: ColorManager.grayForMessage,
                        fontSize: 14
                      ),
                      indicatorPadding: const EdgeInsets.only(bottom: 10.0,left: 30,right: 30),
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorManager.primaryGreen,
                            width: 2.0,
                          ),

                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: ListView.builder(itemBuilder: (context, index) =>  const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CardNotification(),
                      ),itemCount: 5,),
                    ),
                  )
                ],
              )
                  :const GuestScreen(),
            ),

          ],
        ),
      ),
    );
  }
}
