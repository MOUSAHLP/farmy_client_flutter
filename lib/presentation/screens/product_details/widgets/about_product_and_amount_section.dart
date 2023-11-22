import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/counter_box.dart';

class AboutProductAndAmonutSection extends StatelessWidget {
  const AboutProductAndAmonutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "فليفلة خضراء",
            style: getMoreBoldStyle(
              color: ColorManager.black,
              fontSize: FontSizeApp.s15,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Icon(
                Icons.favorite,
                color: ColorManager.grayForMessage,
              )
            ],
          ),
        ),

        //todo bold 700
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Text(
            "فليفلة رقيقة بديلة",
            style: getBoldStyle(
              color: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s15,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCountWidget(
              myIcon: Icons.add,
              onTap: () {},
            ),
            const SizedBox(
              width: 18,
            ),
            InnerShadow(
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(2, 5))
              ],
              child: Container(
                height: 38,
                width: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            CustomCountWidget(
              myIcon: Icons.minimize,
              onTap: () {},
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(thickness: 1),
        ),
      ],
    );
  }
}
