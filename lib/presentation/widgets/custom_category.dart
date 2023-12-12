import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class CustomCategory extends StatelessWidget {
  final String categoryName;
  const CustomCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 97,
          width: 97,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const ClipOval(
            child: CachedImage(
              imageSize: ImageSize.small,
              imageUrl:
                  "http://dashboard.gocheckins.peaklink.site//storage/hotels/6/header1.jpg",
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 24,
          child: Text(
            categoryName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getBoldStyle(
              color: ColorManager.black,
              fontSize: FontSizeApp.s13,
            )!
                .copyWith(
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
