import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/about_product_and_amount_section.dart';
import 'package:pharma/presentation/screens/product_details/widgets/product_image.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_button.dart';
import 'package:pharma/translations.dart';

import '../../resources/font_app.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarScreen(sectionName: "تفاصيل فليفة"),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const ProductImage(
                      productImage:
                          "http://dashboard.gocheckin.xpeaklink.site//storage/hotels/6/header1.jpg"),
                  const AboutProductAndAmonutSection(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.price,
                              style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s15),
                            ),
                            Text(
                              "10.00000 ل س",
                              style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          AppLocalizations.of(context)!.related_products,
                          style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSizeApp.s15),
                        ),
                      ),
                      SizedBox(
                        height: 115,
                        width: 1.sw,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: ColorManager.grayForPlaceholde,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff0000002E),
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                height: 115,
                                width: 115,
                                child: const CachedImage(imageUrl: ""),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          AppLocalizations.of(context)!.similar_products,
                          style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSizeApp.s15),
                        ),
                      ),
                      SizedBox(
                        height: 115,
                        width: 1.sw,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: ColorManager.grayForPlaceholde,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff0000002e),
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                height: 115,
                                width: 115,
                                child: const CachedImage(
                                    imageUrl:
                                        "http://dashboard.gocheckin.peaklink.site//storage/hotels/2/header6.jpg"),
                              ),
                            );
                          },
                        ),
                      ),
                      CustomAppButton(
                        ontap: () {},
                        myText: AppLocalizations.of(context)!.add_to_basket,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 74, vertical: 10),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
