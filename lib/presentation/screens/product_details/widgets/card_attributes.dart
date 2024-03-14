import 'package:flutter/material.dart';
import '../../../../models/product_response.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';

class CardAttributes extends StatelessWidget {
  const CardAttributes({
    super.key,
    required this.productDetails,
  });

  final ProductResponse productDetails;

  @override
  Widget build(BuildContext context) {
    if (productDetails.attributeList.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics() ,
        itemCount: productDetails.attributeList.length,
        itemBuilder:(context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " ${productDetails.attributeList[index].name} : ",
                style: getBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s10,
                ),
              ),
              Expanded(
                child: Text(
                   productDetails.attributeList[index].value,
                  style: getBoldStyle(
                    color: ColorManager.grayForMessage,
                    fontSize: FontSizeApp.s10,
                  ),
                ),
              ),
            ],
          );
        }, ),
    );
  }
}