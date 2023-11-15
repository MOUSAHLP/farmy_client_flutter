import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class CustomProductCard extends StatelessWidget {
  final bool? isDisCount;
  const CustomProductCard({super.key, required this.isDisCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  height: 144,
                  color: ColorManager.grayForPlaceholde,
                  child: const CachedImage(
                    imageUrl: "",
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text("adreess",
                              style: getMoreBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: FontSizeApp.s15)!
                                  .copyWith(height: 1)),
                        )
                      ],
                    ),
                    Container(
                      height: 74,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(6), bottomEnd: Radius.circular(6)),
          child: Container(
            color: ColorManager.primaryGreen,
            height: 18,
            width: 76,
            child: Center(
                child: Text(
              "الاكثر مبيعا",
              style: getMoreBoldStyle(
                      color: ColorManager.white, fontSize: FontSizeApp.s7)!
                  .copyWith(),
            )),
          ),
        )
      ],
    );
  }
}
