import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/sign_in_screen.dart';
import 'package:pharma/translations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation =
        Tween<double>(begin: MediaQuery.of(context).size.height/5, end: 0)
            .animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageManager.auth),
                fit: BoxFit.cover,
              ),
            ),
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
                  Column(
                    children: [
                      const SizedBox(
                        height: 240,
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      Text("أهلاً بك :)",
                          style:
                              getBoldStyle(color: Colors.white, fontSize: 29)),
                      const SizedBox(
                        height: 67,
                      ),
                      ButtonAuth(
                          label:
                              AppLocalizations.of(context)!.new_subscription,
                      onTap: (){

                      }),
                      const SizedBox(
                        height: 27,
                      ),
                      ButtonAuth(
                          label: AppLocalizations.of(context)!.sign_in,
                          onTap: () {
                            AppRouter.push(context, SignInScreen(),);

                          }),
                      const SizedBox(
                        height: 27,
                      ),
                      ButtonAuth(
                          label: AppLocalizations.of(context)!.login_guest),

                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 128,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("فارمي",
                      style: getBoldStyle(color: Colors.white, fontSize: 36)),
                  const SizedBox(
                    width: 5,
                  ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0,_animation.value),
                        child: SvgPicture.asset(IconsManager.logoApp,
                            width: 89, height: 107),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("farmy",
                      style: getBoldStyle(color: Colors.white, fontSize: 36)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
