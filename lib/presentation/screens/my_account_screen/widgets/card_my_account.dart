import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CardMyAccount extends StatelessWidget {
  const CardMyAccount({super.key,required this.title,required this.details,required this.ontap});
final String title;
final String details;
  final Function ()ontap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    title,
                    style: getBoldStyle(
                        color: Colors.black, fontSize: 13),
                  ),
                  Text(
                    details,
                    style: getBoldStyle(
                        color: ColorManager.grayForMessage, fontSize: 10),
                  )
                ],),
              ),
              InkWell(
                onTap: ontap,
                child: const Icon(Icons.arrow_forward_ios,
                  size: 20,
                  color: ColorManager.grayForMessage,),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
