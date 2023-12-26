import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';

enum ImageSize { large, mid, small }

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? placeHolderHeight;
  final double? width;
  final int? cacheWidth;
  final int? cacheHeight;
  final Color? color;
  final String? fallbackPlaceHolder;
  final bool removeOnDispose;
  final ImageSize imageSize;

  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.placeHolderHeight,
    this.width,
    this.cacheHeight,
    this.cacheWidth,
    this.color,
    this.fallbackPlaceHolder,
    this.removeOnDispose = true,
    this.imageSize = ImageSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl ?? '',
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      color: color,
      printError: false,
      cacheMaxAge: const Duration(days: 30),
      clearMemoryCacheWhenDispose: removeOnDispose,
      handleLoadingProgress: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ExtendedImage(
                image: AssetImage(
                  fallbackPlaceHolder ?? getPlaceHolderSize(),
                ),
                clearMemoryCacheWhenDispose: true,
                fit: imageSize == ImageSize.small
                    ? BoxFit.contain
                    : BoxFit.cover,
                color: color,
              ),
            );
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ExtendedImage(
                image: AssetImage(
                  fallbackPlaceHolder ?? getPlaceHolderSize(),
                ),
                clearMemoryCacheWhenDispose: true,
                fit: BoxFit.contain,
                color: color,
              ),
            );
        }
      },
    );
  }

  String getPlaceHolderSize() {
    switch (imageSize) {
      case ImageSize.large:
        return ImageManager.placeholderLogo;
      case ImageSize.mid:
        return ImageManager.placeholderLogo;
      case ImageSize.small:
        return ImageManager.placeholderLogo;
    }
  }
}
