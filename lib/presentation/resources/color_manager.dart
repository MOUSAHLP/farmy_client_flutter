import 'package:flutter/material.dart';

class ColorManager {
  static const primaryGreen = Color(0xff4F8640);
  static const softGreen = Color(0xff305C36);
  static const lightGreen = Color(0xff172F20);
  static const darkGreen = Color(0xff224A32);
  static const grayForMessage = Color(0xff727272);
  static const blackGreen = Color(0xff172F20);
  static const lightGray = Color(0xffE4E4E4);
  static const grayForPlaceholder = Color(0xffF4F4F4);
  static const black = Color(0xff1E1E1E);
  static const white = Color(0xffFFFFFF);
  static const grayForSearch = Color(0xffD9D9D9);
  static const grayForSearchProduct = Color(0xff9B9B9B);
  static const redForFavorite = Color(0xffBF0000);

// crown color
  static const bronze = Color(0xffE7A17B);
  static const silver = Color(0xff737373);
  static const gold = Color(0xffEAA441);
  static const platinium = Color(0xff6DA7CA);
  static const vip = Color(0xffE5A2DA);
  static const vipPlus = Color(0xff8DB6E2);

  static const linearGradientPrimary = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.0172, 0.983],
    colors: [
      primaryGreen,
      softGreen,
    ],
    transform: GradientRotation(177.96),
  );

  static const greyForUnSelectedItem = Color(0xffD6D3D3);
  //box-shadow: 0px 0px 4px 0px #0000001A;
  static BoxShadow shadowGaryDown = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.18),
    offset: const Offset(0, 2),
    blurRadius: 4.0,
  );

  static BoxShadow shadowGaryDownInner = BoxShadow(
      color: const Color(0xFF000000).withOpacity(0.18),
      offset: const Offset(0, 2),
      blurRadius: 4.0,
      blurStyle: BlurStyle.inner);

  static BoxShadow shadowGaryDownSoft = BoxShadow(
    color: const Color(0xFF000000)
        .withOpacity(0.18), // Adjust the opacity as needed
    offset: const Offset(0, 3), // Adjust the vertical offset
    blurRadius: 4.0,
  );

  static BoxShadow shadowGaryDownSoftOuter = BoxShadow(
      color: const Color(0xFF000000)
          .withOpacity(0.18), // Adjust the opacity as needed
      offset: const Offset(0, 3), // Adjust the vertical offset
      blurRadius: 4.0,
      blurStyle: BlurStyle.outer);

  static BoxShadow shadowGaryUp = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.18),
    offset: const Offset(0, -3),
    blurRadius: 4.0,
  );
  static BoxShadow shadowGaryRightDown = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.1),
    offset: const Offset(1, 1),
    blurRadius: 2.0, //
    spreadRadius: 1.0,
  );
  static const grayForm = Color(0xffE4E4E4);
  static const yellow = Color(0xffEDCC2F);
}
