import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/models/banners_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHomeCursel extends StatefulWidget {
  final bool? isLoadingState;
  final List<BannersResponse>? bannerList;
  final double height;
  final double? verticalPadding;

  const CustomHomeCursel({
    Key? key,
    required this.height,
    this.isLoadingState,
    this.bannerList = const [],
    this.verticalPadding,
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
          widget.isLoadingState == true ? 2 : widget.bannerList!.length,
          (index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 13, vertical: widget.verticalPadding ?? 30),
              child: GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse(widget.isLoadingState == true
                      ? ""
                      : widget.bannerList![index].bannerLink ?? "");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: ColorManager.grayForPlaceholde,
                      // height: 0.35.sw,
                      width: 1.sw,

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CachedImage(
                            imageUrl: widget.isLoadingState == true
                                ? ""
                                : widget.bannerList![index].bannerLink,
                            imageSize: ImageSize.large,
                          ),
                        ),
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
