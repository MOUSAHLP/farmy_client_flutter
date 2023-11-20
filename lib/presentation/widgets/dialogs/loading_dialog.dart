
import 'package:flutter/material.dart';

import 'package:pharma/core/app_router/dialog_transition_builder.dart';
import 'package:pharma/presentation/resources/color_manager.dart';


import '../../../core/app_router/app_router.dart';
import '../../../translations.dart';

class LoadingDialog {
  static final LoadingDialog _loadingDialog = LoadingDialog._internal();

  factory LoadingDialog() {
    return _loadingDialog;
  }

  LoadingDialog._internal();

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
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            color: ColorManager.primaryGreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SpinKitRipple(
              //   itemBuilder: (_, int index) {
              //     return const ImageIcon(
              //       AssetImage(
              //         ImageManager.fullAppLogo,
              //       ),
              //       size: 40,
              //       color: Colors.white,
              //     );
              //   },
              // ),
              Text(
                AppLocalizations.of(context)!.processing,
                style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none, ////set decoration to .none
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
