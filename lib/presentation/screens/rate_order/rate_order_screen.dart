import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/rate_attribute.dart';
import 'package:pharma/presentation/screens/rate_order/widget/custom_rate_cause.dart';
import 'package:pharma/presentation/widgets/custom_loading.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';

import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../bloc/rate_bloc/rate_bloc.dart';
import '../../../bloc/rate_bloc/rate_event.dart';
import '../../../bloc/rate_bloc/rate_state.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_rating.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../auth_screen/ widgets/input_field_auth.dart';
import '../order_screen/order_screen.dart';

class RateOrderScreen extends StatefulWidget {
  final int orderId;
  RateOrderScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  _RateOrderScreenState createState() => _RateOrderScreenState();
}

class _RateOrderScreenState extends State<RateOrderScreen> {
  List<RateAttribute> attributeList = [];
  List<RateAttribute> selectedAttribute = [];
  RateBloc rateBloc = RateBloc();
  bool showTextField = false;
  double rate = 0.0;
  TextEditingController causeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    rateBloc.add(GetRateAttribute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: Image.asset(
                  ImageManager.rate,
                  fit: BoxFit.cover,
                  width: 0.35.sw,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.order_delivered_successfully,
                  textAlign: TextAlign.center,
                  style: getBoldStyle(
                      fontSize: 28.sp, color: ColorManager.grayForMessage),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "(:  ",
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          fontSize: 28.sp, color: ColorManager.grayForMessage),
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .thanks_for_shopping_in_farmy,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          fontSize: 22.sp, color: ColorManager.grayForMessage),
                    ),
                  ],
                ),
              ],
            ),
            10.verticalSpace,
            Text(
              AppLocalizations.of(context)!.rate_order_and_get_points,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  fontSize: 18.sp, color: ColorManager.primaryGreen),
            ),
            CustomRating(
              rate: rate,
              itemSize: 40.w,
              padding: const EdgeInsetsDirectional.only(
                  end: 20, top: 20, bottom: 20),
              onRatingUpdate: (double value) {
                rate = value;
                // context.read<RateBloc>().add(SubmitRate(rate: value));
              },
            ),
            25.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppLocalizations.of(context)!
                    .what_do_you_think_to_get_better_experience,
                textAlign: TextAlign.end,
                style: getSemiBoldStyle(
                    fontSize: 18.sp, color: ColorManager.grayForMessage),
              ),
            ),
            BlocConsumer(
              bloc: rateBloc,
              listener: (context, state) {
                if (state is SuccessGetRateAttribute) {
                  attributeList = state.attributeList ?? [];
                }
                if (state is FailGetRateAttribute) {}
              },
              builder: (context, state) {
                return state is LoadingGetRateAttribute
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1.sw,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [1, 2, 3, 4, 5]
                              .map((e) => Container(
                                    width: 0.25.sw,
                                    height: 0.05.sh,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: ColorManager.lightGray,
                                        borderRadius: BorderRadius.circular(5)),
                                  ))
                              .toList(),
                        ).animate().shimmer(),
                      )
                    : Wrap(
                        children: attributeList
                            .map((e) => CustomRateCause(
                                  onTab: () {
                                    if (selectedAttribute.contains(e)) {
                                      selectedAttribute.remove(e);
                                    } else {
                                      selectedAttribute.add(e);
                                    }
                                    if (selectedAttribute.any((element) =>
                                        element.hasInput == true)) {
                                      showTextField = true;
                                    } else {
                                      showTextField = false;
                                    }

                                    setState(() {});
                                  },
                                  selectedAttribute: selectedAttribute,
                                  rateAttribute: e,
                                ))
                            .toList(),
                      );
              },
            ),
            showTextField
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: causeController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        fillColor: ColorManager.lightGray,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.lightGreen),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.lightGreen),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.lightGreen),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            25.verticalSpace,
            BlocConsumer(
              bloc: rateBloc,
              listener: (context, state) {
                if (state is LoadingRateState) {
                  LoadingDialog().openDialog(context);
                } else if (state is SuccessRateState) {
                  LoadingDialog().closeDialog(context);

                  AppRouter.pushReplacement(context, OrderScreen());
                } else if (state is FailRateState) {
                  LoadingDialog().closeDialog(context);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  label: AppLocalizations.of(context)!.confirm,
                  onTap: () {
                    rateBloc.add(SubmitRate(
                        orderId: widget.orderId,
                        rate: rate,
                        selectedAttribute: selectedAttribute
                            .map((e) => SelectedRateAttribute(
                                id: e.id,
                                input: e.hasInput ? causeController.text : ""))
                            .toList()));
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: InkWell(
                  onTap: () {
                    AppRouter.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel_outlined,
                    size: 50,
                    color: ColorManager.grayForSearch,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: Container(
        width: 1.sw,
        height: 130.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              ColorManager.blackGreen,
              ColorManager.primaryGreen,
              ColorManager.darkGreen
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "فارمي",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
