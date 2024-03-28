import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/notification_screen/widgets/card_notification.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/notification_bloc/notification_bloc.dart';
import '../../../bloc/notification_bloc/notification_event.dart';
import '../../../bloc/notification_bloc/notification_state.dart';
import '../../../core/services/services_locator.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_loading_widget.dart';
import '../../widgets/custom_no_dataa.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        child: const NotificationScreenBody(),
        create: (context) {
          if (sl<AuthenticationBloc>().loggedIn) {
            return   sl<NotificationBloc>()
              ..add(GetNotificationList(3));
          }
          return sl<NotificationBloc>();

          });
  }
}

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({super.key});

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody>
    with TickerProviderStateMixin {
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
            sl<AuthenticationBloc>().loggedIn
                ? Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 1,
                      ),
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
                          controller:
                          context
                              .read<NotificationBloc>()
                              .tabController,
                          tabs: [
                            Tab(
                              child: FittedBox(
                                  child: Text(AppLocalizations.of(context)!
                                      .app_Notifications)),
                            ),
                            Tab(
                              child: FittedBox(
                                  child: Text(AppLocalizations.of(context)!
                                      .offers_Notifications)),
                            ),
                          ],
                          unselectedLabelColor: ColorManager.grayForMessage,
                          labelColor: ColorManager.primaryGreen,
                          onTap: (v) {
                            print("===========v");
                            print(v);
                            context
                                .read<NotificationBloc>()
                                .add(TapOnPressedNotification(v));
                          },
                          labelStyle: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: 14),
                          indicatorPadding: const EdgeInsets.only(
                              bottom: 10.0, left: 30, right: 30),
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
                        child: BlocBuilder<NotificationBloc,NotificationState>(
                        builder: (context, state) {
                          if(state is NotificationLoading) {
                            return const Center(child: CustomLoadingWidget());
                          }
                          if(state is NotificationError) {
                            return Center(
                              child: CustomErrorScreen(
                                onTap: () {
                                  context.read<NotificationBloc>().add(GetNotificationList(3));
                                },
                              ),
                            );
                          }
                          if(state is NotificationSuccess) {
                            return Column(
                              children: [

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28),
                                    child: context
                                        .read<NotificationBloc>().listNotification.isNotEmpty? ListView.builder(
                                      itemBuilder: (context, index) =>
                                       Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: CardNotification(notificationModel: context
                                            .read<NotificationBloc>().listNotification[index]),
                                      ),
                                      itemCount: context
                                          .read<NotificationBloc>().listNotification.length,
                                    )
                                     :  CustomNoData(noDataStatment: AppLocalizations.of(context)!.no_notifications,)
                                  ),
                                )
                              ],
                            );
                          }
                          else return SizedBox();
                        },
            ),
                      ),
                    ],
                  ),
                ) : const GuestScreen(),
          ],
        ),
      ),
    );
  }
}
