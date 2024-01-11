import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, required this.content, this.icon, this.color})
      : super(key: key);
  final Widget content;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return
      Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.all(
                      Radius.circular(20),

                    ),
                    color: Colors.white,
                      border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: content,
                  ),
                ),
                // PositionedDirectional(
                //   top: -30,
                //   // bottom: 10,
                //   // end:  -20,
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       color: Colors.white,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(4.0),
                //       child: InkWell(
                //         onTap: (){
                //           AppRouter.pop(context);
                //         },
                //         child: Container(
                //           height: 50,
                //           width: 50,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: color ?? ColorManager.primaryGreen,
                //           ),
                //           child:  SpinKitPumpingHeart(
                //             itemBuilder: (_, int index) {
                //               return
                //               Icon(
                //                 icon ?? Icons.close,
                //                     color: Colors.white,
                //                   );
                //             },
                //           )
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
