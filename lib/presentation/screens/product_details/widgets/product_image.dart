import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class ProductImage extends StatelessWidget {
  final String productImage;
  const ProductImage({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 1.sw,
          height: 0.75.sw,
          decoration: BoxDecoration(
            color: ColorManager.grayForPlaceholde,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            child: CachedImage(
                imageSize: ImageSize.large,
                imageUrl:
                    "http://dashboarsd.gocheckin.peaklink.site//storage/hotels/6/header1.jpg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(3, 3),
                      )
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    color: ColorManager.primaryGreen,
                  ),
                ),
              ),
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(3, 3),
                    )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.share_outlined,
                    color: ColorManager.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
