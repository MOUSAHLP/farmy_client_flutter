import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/screens/main_screen/main_screen.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import 'location_second_screen.dart';

class LocationFirstScreen extends StatefulWidget {
  const LocationFirstScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationFirstScreenState createState() => _LocationFirstScreenState();
}

class _LocationFirstScreenState extends State<LocationFirstScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isImageShrunk = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              color: ColorManager.primaryGreen,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style:
                            getRegularStyle(color: Colors.white, fontSize: 16),
                      ),
                      onTap: () {
                        AppRouter.push(context, const MainScreen());
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          "فارمي",
                          style: getBoldStyle(
                              color: Colors.white, fontSize: FontSizeApp.s24),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        SvgPicture.asset(
                          IconsManager.logoApp,
                          height: 31,
                          width: 31,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.push(context, const MainScreen());
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ImageManager.backgroundLocation,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 33,
                            ),
                            Text(
                              AppLocalizations.of(context)!.welcome_to_Farmy,
                              style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: 26),
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .please_choose_delivery_location,
                              style: getRegularStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: isImageShrunk ? 16 : 22),
                            ),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(0.0, -10.0 * _animation.value),
                                  child: Image.asset(
                                    ImageManager.locationFirst,
                                    width: isImageShrunk ? 80 : 145,
                                    height: isImageShrunk ? 80 : 161,
                                  ),
                                );
                              },
                            ),
                            isImageShrunk
                                ? Container(
                                    // height: 50,
                                    width: 1.sw,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow:[ ColorManager.shadowGaryDown]
                              ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 8),
                                      child: Column(
                                        children: [
                                          const Icon(Icons.location_on,color: Colors.blue,),
                                           const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10),
                                            child: Text(
                                                "السماح لفارمي باستخدام موقع جهازك"),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                      ImageManager.select),
                                                  const Text("تقريبي")
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                      ImageManager.select2),
                                                  const Text("دقيق")
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                                            child: InkWell(
                                              onTap: (){
                                                AppRouter.push(context,
                                                    const LocationSecondScreen());
                                              },
                                              child: Text("فقط عند استخدام التطبيق",
                                                  style: getBoldStyle(
                                                      color: Colors.black)),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              AppRouter.push(context,
                                                  const LocationSecondScreen());
                                            },
                                            child: Text("هذه المرة فقط",
                                                style: getBoldStyle(
                                                    color: Colors.black)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                                            child: InkWell(
                                              onTap: (){
                                                AppRouter.push(context,
                                                    const MainScreen());
                                              },
                                              child: Text("عدم السماح",
                                                  style: getBoldStyle(
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            isImageShrunk
                                ? const SizedBox(
                                    height:0,
                                  )
                                : const SizedBox(
                                    height: 180,
                                  ),
                            isImageShrunk?const SizedBox(): Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomButton(
                                      label: AppLocalizations.of(context)!
                                          .select_delivery_location,
                                      onTap: () {
                                        setState(() {
                                          isImageShrunk = true;
                                          _controller.forward();
                                        });
                                        // Add your navigation logic here
                                      }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomButton(
                                    label: AppLocalizations.of(context)!
                                        .skip_stage_now,
                                    isFilled: true,
                                    labelColor: ColorManager.primaryGreen,
                                    fillColor: Colors.white,
                                    borderColor: ColorManager.primaryGreen,
                                    onTap: () {
                                      AppRouter.push(context, const MainScreen());
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
