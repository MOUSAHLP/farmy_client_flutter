import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/presentation/widgets/dialogs/custom_dialog.dart';
import 'package:pharma/translations.dart';

class RewardsPointDialog {
  static void openDialog(BuildContext context, String? points) {
    dialogTransitionBuilder(
        context,
        _RewardsPointDialogBody(
          points: points!,
        ));
  }
}

class _RewardsPointDialogBody extends StatefulWidget {
  final String points;
  _RewardsPointDialogBody({required this.points});

  @override
  State<_RewardsPointDialogBody> createState() =>
      _RewardsPointDialogBodyState();
}

class _RewardsPointDialogBodyState extends State<_RewardsPointDialogBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> tween = Tween(begin: 0.1, end: 1);

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 20,
            ),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.congrats,
                  style: getBoldStyle(
                    color: ColorManager.primaryGreen,
                    fontSize: FontSizeApp.s14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingApp.p10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        ImageManager.logoGuest,
                        opacity: const AlwaysStoppedAnimation(.5),
                      ),
                      ScaleTransition(
                        scale: tween.animate(CurvedAnimation(
                            parent: _controller, curve: Curves.ease)),
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImageManager.stars,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            widget.points,
                            style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s26,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.point,
                            style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: PaddingApp.p20),
            child: Text(
              // "لقد حصلت على $points نقطة",
              "${AppLocalizations.of(context)!.you_got} ${widget.points} ${AppLocalizations.of(context)!.point}",
              style: getRegularStyle(
                color: ColorManager.grayForMessage,
                fontSize: FontSizeApp.s15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: PaddingApp.p20),
            child: CustomButton(
              label: AppLocalizations.of(context)!.done,
              onTap: () {
                AppRouter.pop(context);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
