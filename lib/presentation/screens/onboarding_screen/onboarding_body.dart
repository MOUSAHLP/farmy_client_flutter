import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/translations.dart';
import '../../../../bloc/onboarding_bloc/onboarding_bloc.dart';
import '../../../../bloc/onboarding_bloc/onboarding_state.dart';
import '../../../bloc/language_bloc/language_bloc.dart';
import '../../../bloc/language_bloc/language_event.dart';
import '../../../bloc/language_bloc/language_state.dart';
import '../../widgets/custom_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody(
      {super.key, required this.boardingBody, required this.index});

  final BoardingBody boardingBody;
  final int index;

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double height = 0.7.sh;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // Adjust duration as needed
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant OnBoardingViewBody oldWidget) {
    // Reset the animation
    _controller.reset();
    // Start the animation
    _controller.forward();
    setState(() {});
    if (widget.index == 0) {
      height = 0.7.sh;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) => Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                children: [
                  AnimatedContainer(
                    height: height,
                    width: 1.sw,
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.zero,
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      widget.boardingBody.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: CustomPaint(
                painter: CurvedPainter(
                  screen: widget.index,
                  leftStart: 0.5,
                  leftEnd: 0.6,
                  rightStart: widget.index == 2 ? 0.6 : 0.7,
                  rightEnd: widget.index == 2 ? 0.5 : 0.6,
                  centerStart: 0.9,
                  centerEnd: 0.5,
                  // Adjust values as needed
                  animation: _animation,
                ),
                size: MediaQuery.of(context).size,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              height: 1.sh / 2.5,
              child: widget.index != 0
                  ? buildBoardingBody(context)
                  : buildLanguageBody(context),
            ),
          ),
        ],
      ),
    );
  }

  Column buildBoardingBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            height: 80.h,
            width: 1.sw,
            child: Text(
              widget.boardingBody.text ?? "",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: getBoldStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i < 4; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: i == widget.index
                        ? ColorManager.yellow
                        : ColorManager.grayForSearch,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 47),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomButton(
            label: AppLocalizations.of(context)!.next,
            isFilled: true,
            fillColor: Colors.white,
            labelColor: ColorManager.primaryGreen,
            onTap: () {
              if (context.read<OnBoardingBloc>().currentPage == 3) {
                context.read<OnBoardingBloc>().add(OnPressedSkip());
              } else {
                // Reset the animation
                _controller.reset();
                // Start the animation
                _controller.forward();
                context.read<OnBoardingBloc>().add(ChangeIndex(
                    context.read<OnBoardingBloc>().currentPage + 1));
              }
            },
          ),
        )
      ],
    );
  }

  Column buildLanguageBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "اختر اللغة",
          style: getBoldStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          "Choose Language",
          style: getBoldStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.ltr,
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Container(
                  width: 1.sw,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (context.read<LanguageBloc>().lang == "ar") {
                                context.read<LanguageBloc>().add(
                                      NewLanguageChange("en"),
                                    );
                              }
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: context.read<LanguageBloc>().lang == "en"
                                    ? ColorManager.primaryGreen
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "English",
                                  style: getBoldStyle(
                                    color: context.read<LanguageBloc>().lang ==
                                            "en"
                                        ? Colors.white
                                        : ColorManager.primaryGreen,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (context.read<LanguageBloc>().lang == "en") {
                                context.read<LanguageBloc>().add(
                                      NewLanguageChange("ar"),
                                    );
                              }
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: context.read<LanguageBloc>().lang == "ar"
                                    ? ColorManager.primaryGreen
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "عربي",
                                  style: getBoldStyle(
                                    color: context.read<LanguageBloc>().lang ==
                                            "ar"
                                        ? Colors.white
                                        : ColorManager.primaryGreen,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 47),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: CustomButton(
            label: AppLocalizations.of(context)!.next,
            isFilled: true,
            fillColor: Colors.white,
            labelColor: ColorManager.primaryGreen,
            onTap: () {
              setState(() {
                height = 0.8.sh;
              });
              context.read<OnBoardingBloc>().add(ChangeIndex(1));
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CurvedPainter extends CustomPainter {
  final int screen;
  final double leftStart;
  final double leftEnd;
  final double rightStart;
  final double rightEnd;
  final double centerStart;
  final double centerEnd;
  final Animation<double> animation;

  CurvedPainter({
    required this.screen,
    required this.leftStart,
    required this.leftEnd,
    required this.rightStart,
    required this.rightEnd,
    required this.centerStart,
    required this.centerEnd,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = ColorManager.primaryGreen
      ..strokeWidth = 15;

    var path = Path();

    double leftHeight = lerpDouble(leftStart, leftEnd, animation.value) ?? 0.0;
    double rightHeight =
        lerpDouble(rightStart, rightEnd, animation.value) ?? 0.0;
    double centerHeight =
        lerpDouble(centerStart, centerEnd, animation.value) ?? 0.0;

    switch (screen) {
      case 0:
        path.moveTo(0, size.height * 0.53);
        path.quadraticBezierTo(size.width * 0.4, size.height * 0.6,
            size.width * 1, size.height * 0.6);
        break;
      case 1:
        path.moveTo(0, size.height * 0.53);
        path.quadraticBezierTo(size.width * 0.4, size.height * 0.6,
            size.width * 1, size.height * 0.6);
        break;
      case 2:
        path.moveTo(0, size.height * leftHeight);
        path.quadraticBezierTo(size.width * 0.6, size.height * 0.6,
            size.width * 1, size.height * rightHeight);
        break;
      case 3:
        path.moveTo(0, size.height * rightHeight);
        path.quadraticBezierTo(size.width * centerHeight, size.height * 0.5,
            size.width * 1, size.height * leftHeight);
        break;
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// first screen
//  path.moveTo(0, size.height * 0.53);
//     path.quadraticBezierTo(size.width * 0.4, size.height * 0.6,
//         size.width * 1, size.height * 0.6);

// second screen
// path.moveTo(0, size.height * 0.6);
// path.quadraticBezierTo(
//     size.width * 0.6, size.height * 0.6, size.width * 1, size.height * 0.5);

// leftStart: 0.5,
// leftEnd: 0.6,
// rightStart: 0.6,
// rightEnd: 0.5,

/// third screen
///  path.moveTo(0, size.height * 0.5);
//     path.quadraticBezierTo(
//         size.width * 0.5, size.height * 0.44, size.width * 1, size.height * 0.5);
//

//  leftStart: 0.5,
//  leftEnd: 0.6,
//  rightStart: 0.7,
//  rightEnd: 0.6,
//  centerStart: 1,
//  centerEnd: 0.5,
