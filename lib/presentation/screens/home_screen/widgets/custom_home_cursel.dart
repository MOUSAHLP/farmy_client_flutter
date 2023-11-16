import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class CustomHomeCursel extends StatefulWidget {
  final double height;

  const CustomHomeCursel({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<CustomHomeCursel> createState() => _CustomHomeCurselState();
}

class _CustomHomeCurselState extends State<CustomHomeCursel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: widget.height,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          enlargeFactor: 0,
          viewportFraction: 1.0,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {});
          },
        ),
        items: List.generate(
          4,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: ColorManager.grayForPlaceholde,
                    // height: 0.35.sw,
                    width: 1.sw,

                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CachedImage(
                          imageUrl: "asdasd",
                          imageSize: ImageSize.large,
                        ),
                      ),
                    ),
                  )),
            );
          },
        ));
  }
}
