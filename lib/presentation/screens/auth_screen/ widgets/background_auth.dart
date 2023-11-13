import 'package:flutter/material.dart';

import 'package:miamed/core/app_router/app_router.dart';
import 'package:miamed/presentation/resources/color_manager.dart';
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height:82,),
                  Image.asset(IconsManager.logo,width: 101,height: 93),
                  child
                ],
              ),
            ),
          ),
        showIcon?
         PositionedDirectional(
              top: 50,
              start: 10,
              child: InkWell
                (
                  onTap: (){
                    AppRouter.pop(context);
                  },
                  child: const Icon(Icons.arrow_back,color: ColorManager.primaryColor,size: 40,))):
        const SizedBox(),

        ],
      ),
    );
  }
}
