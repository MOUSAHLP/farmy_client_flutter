import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/my_evaluation/widgets/custom_details_evaluation_row.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class MyEvaluationScreen extends StatelessWidget {
  const MyEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.my_Reviews),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 21),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 15, end: 21, bottom: 17),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.18),
                            offset: const Offset(0, 2),
                            blurRadius: 4.0,
                          )
                        ]),
                        width: 1.sw,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 21, horizontal: 15),
                          child: Column(
                            children: [
                              CustomDetailsEvaluationsRow(
                                  label: AppLocalizations.of(context)!
                                      .order_Number,
                                  valueOfLabel: "89465874896"),
                              CustomDetailsEvaluationsRow(
                                  label:
                                      AppLocalizations.of(context)!.order_Date,
                                  valueOfLabel: "11/4/2023"),
                              CustomDetailsEvaluationsRow(
                                  label: AppLocalizations.of(context)!.site,
                                  valueOfLabel: "كورنيش التجارة"),
                              CustomDetailsEvaluationsRow(
                                  label: AppLocalizations.of(context)!
                                      .delivery_Operator_Name,
                                  valueOfLabel: "ميار جباصيني"),
                              CustomDetailsEvaluationsRow(
                                  label:
                                      AppLocalizations.of(context)!.total_price,
                                  valueOfLabel: "220.00 ل.س"),
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.evaluation,
                                    style: getBoldStyle(
                                        color: ColorManager.grayForMessage,
                                        fontSize: FontSizeApp.s13),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    itemSize: 22,

                                    initialRating: 4.0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    // itemPadding: const EdgeInsets.symmetric(horizontal: 22.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (value) {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
