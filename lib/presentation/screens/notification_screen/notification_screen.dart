import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/notification_screen/widgets/card_notification.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 60,),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) =>  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CardNotification(),
                    ),itemCount: 5,),
                  )

                ],
              ),
            ),
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.notification),
          ],
        ),
      ),
    );
  }
}
