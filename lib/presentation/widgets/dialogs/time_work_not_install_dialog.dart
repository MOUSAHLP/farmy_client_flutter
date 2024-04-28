import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/custom_app_button.dart';

import '../../../core/app_router/app_router.dart';
import '../../../translations.dart';

class TimeWorkNotInstallDialog {
  static final TimeWorkNotInstallDialog _loadingDialog = TimeWorkNotInstallDialog._internal();

  factory TimeWorkNotInstallDialog() {
    return _loadingDialog;
  }

  TimeWorkNotInstallDialog._internal();

  bool _isShown = false;

  void closeDialog(BuildContext context) {
    if (_isShown) {
      AppRouter.pop(context);
      _isShown = false;
    }
  }

  void openDialog(BuildContext context) {
    _isShown = true;
    dialogTransitionBuilder(context, const _LoadingDialogBody())
        .whenComplete(() => _isShown = false);
  }
}

class _LoadingDialogBody extends StatelessWidget {
  const _LoadingDialogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 418.h,
          width: 343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                28.0.r,
              ),
            ),
            color: ColorManager.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageManager.timeWork),
                SizedBox(height: 33.h),
                Text(
                  " ${AppLocalizations.of(context)!.store_is_closed} :(",
                  style: TextStyle(
                    color: ColorManager.redForFavorite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,

                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 26.h),
                CustomAppButton(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 110.w),
                  myText: AppLocalizations.of(context)!.order_scheduling,
                  ontap: () {
                    TimeWorkNotInstallDialog().closeDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
