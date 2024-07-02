import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../bloc/tracking_bloc/tracking_bloc.dart';
import '../../../bloc/tracking_bloc/tracking_event.dart';
import '../../../bloc/tracking_bloc/tracking_state.dart';
import '../../../core/app_router/app_router.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';

class OrderVerifyCode extends StatefulWidget {
  final int orderId;

  const OrderVerifyCode({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderVerifyCodeState createState() => _OrderVerifyCodeState();
}

class _OrderVerifyCodeState extends State<OrderVerifyCode> {
  final TextEditingController textEditingController = TextEditingController();
  TrackingBloc trackingBloc = TrackingBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trackingBloc.add(GetVerifyCode(orderId: widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryGreen,
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Stack(
          children: [
            Container(
              height: 280.h,
              color: ColorManager.primaryGreen,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.farmy,
                          style: getBoldStyle(
                              color: Colors.white, fontSize: FontSizeApp.s24),
                        ),
                        const SizedBox(width: 6),
                        SvgPicture.asset(
                          IconsManager.logoApp,
                          height: 31,
                          width: 31,
                        ),
                      ],
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.order_verify_code,
                      style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSizeApp.s20)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(AppLocalizations.of(context)!.order_verify_code_desc,
                      textAlign: TextAlign.center,
                      style: getSemiBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeApp.s15,
                      ))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 490.h,
                    color: ColorManager.white,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.h),
                          child: Image.asset(
                            IconsManager.successIcon,
                            width: 100.w,
                            height: 100.w,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        BlocConsumer(
                          bloc: trackingBloc,
                          listener: (context, state) {
                            if (state is GetVerifyCodeSuccess) {
                              textEditingController.text = state.code;
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: PinFieldAutoFill(
                                decoration: BoxLooseDecoration(
                                  strokeColorBuilder: const FixedColorBuilder(
                                      ColorManager.primaryGreen),
                                  bgColorBuilder:
                                      const FixedColorBuilder(Colors.white),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: ColorManager.primaryGreen),
                                ),
                                currentCode: textEditingController.text,
                                codeLength: 6,
                                enabled: false,
                                onCodeChanged: (String? code) {
                                  if (code != null) {
                                    textEditingController.text = code;
                                    if (code.length == 6) {}
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        CustomButton(
                          label: AppLocalizations.of(context)!.next,
                          onTap: () {
                            AppRouter.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
