import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import '../../../resources/assets_manager.dart';

class BackGroundAuth extends StatelessWidget {
  const BackGroundAuth({
    Key? key,
    this.showIcon = true,
    required this.child,
  }) : super(key: key);
  final bool showIcon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(ImageManager.auth,fit: BoxFit.cover,),

            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage(ImageManager.auth),
            //   fit: BoxFit.cover,
            // )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          color: ColorManager.primaryGreen.withOpacity(0.65),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 69,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("فارمي",style: getBoldStyle(color: Colors.white,fontSize: 36)),
                      const SizedBox(width: 5,),
                      SvgPicture.asset(IconsManager.logoApp,
                          width: 89, height: 107),
                      const SizedBox(width: 5,),
                      Text("farmy",style: getBoldStyle(color: Colors.white,fontSize: 36)),

                    ],
                  ),
                  child
                ],
              ),
            ),
          ),

          // showIcon
          //     ? PositionedDirectional(
          //         top: 50,
          //         start: 10,
          //         child: InkWell(
          //             onTap: () {
          //               AppRouter.pop(context);
          //             },
          //             child: const Icon(
          //               Icons.arrow_back,
          //               color: ColorManager.primaryGreen,
          //               size: 40,
          //             )))
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
