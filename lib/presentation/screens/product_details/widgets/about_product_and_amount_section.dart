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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("فليفلة خضراء",
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeApp.s15,
                        )),
                    Text("فليفلة رقيقة بديلة",
                        style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s15,
                        )),
                  ],
                ),
                const Icon(
                  Icons.favorite,
                  color: ColorManager.grayForMessage,
                  size: 28,
                ),
              ],
            ),
          ),

          //todo bold 700

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
                myIcon: Icons.remove,
                onTap: () {},
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
