import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/notification_screen/widgets/card_notification.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              child:  sl<AuthenticationBloc>().loggedIn?Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 60,),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) =>  const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CardNotification(),
                      ),itemCount: 5,),
                    )

                  ],
                ),
              ):const GuestScreen(),
            ),
           
          ],
        ),
      ),
    );
  }
}
