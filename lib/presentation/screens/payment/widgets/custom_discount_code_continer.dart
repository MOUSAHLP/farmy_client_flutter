import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomDiscountCodeContainer extends StatefulWidget {
  final String subjectText;
  final String imageUrl;
  final bool? isReplacePoint;

  const CustomDiscountCodeContainer({
    super.key,
    required this.subjectText,
    required this.imageUrl,
    this.isReplacePoint = false,
  });

  @override
  State<CustomDiscountCodeContainer> createState() =>
      _CustomDiscountCodeContainerState();
}

class _CustomDiscountCodeContainerState
    extends State<CustomDiscountCodeContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        children: [
          Container(
            height: 61,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorManager.grayForMessage,
                  width: 1,
                )),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  widget.imageUrl,
                  height: 39,
                  width: 39,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    widget.subjectText,
                    style: getBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s10)!
                        .copyWith(height: 1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                widget.isReplacePoint == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primaryGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 22,
                          width: 22,
                          child: isExpanded
                              ? Image.asset(ImageManager.dropUp)
                              : Image.asset(ImageManager.dropDown),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          AnimatedCrossFade(
            secondCurve: Curves.linear,
            duration: const Duration(milliseconds: 200),
            firstChild: const SizedBox(),
            secondChild: Container(
              height: 180,
              alignment: Alignment.center,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    "100 نقطة = 3500 ل.س",
                    style: getBoldStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s12,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black.withOpacity(0.2),
                ),
                itemCount: 5,
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
