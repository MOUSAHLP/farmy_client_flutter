import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import 'package:flutter/material.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:pharma/presentation/widgets/custom_back_to_previos.dart';
import 'package:pharma/translations.dart';
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: Colors.white,
        body: Column(children: [
           CustomBackToPrevios(sectionName: AppLocalizations.of(context)!.basket),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 11),
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.final_product_appearance,style: getRegularStyle(color: ColorManager.grayForMessage)),
             SizedBox(height: 20),
                Container(
                  height:115 ,
                  width: 1.sw,

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.18),
                          offset: const Offset(0, 2),
                          blurRadius: 4.0,
                        ),
                      ],
                    color: Colors.white
                        ,borderRadius: BorderRadius.circular(6)
                      //box-shadow: 0px 2px 4px 0px #0000002E;
                  ),child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(height: 36,
                          width: 36,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000).withOpacity(0.18),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ],
                                color: Colors.white
                            ),
                            child: const Icon(Icons.add,color: ColorManager.primaryGreen),),

                          Container(height: 36,
                          width: 36,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000).withOpacity(0.18),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ],
                                color: Colors.white
                            ),
                            child: const Icon(Icons.remove,color: Colors.red),),
                        ],
                      ),
                    ),
                 const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "فليفلة حمراء",
                          style: getMoreBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSizeApp.s10)!
                              .copyWith(height: 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Text(
                              "400 غ",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s13)!
                                  .copyWith(height: 1),
                            ),
                            Text(
                              " / ",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s13)!
                                  .copyWith(height: 1),
                            ),
                            Text(
                              "15 قطعة",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s10)!
                                  .copyWith(height: 1),
                            ),
                          ],
                        ),
                      ),
                      Text("discount",
                          style: getRegularStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s12)!
                              .copyWith(
                              decoration: TextDecoration.lineThrough,
                              height: 1)),
                    ],),
const SizedBox(width: 19,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        height: 115,
                        color: ColorManager.grayForPlaceholde,
                        child: const CachedImage(
                          imageUrl: "",
                        ),
                      ),
                    ),
                  ],
                ),


                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
