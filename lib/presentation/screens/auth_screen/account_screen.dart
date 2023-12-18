import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/button_auth.dart';
import 'package:pharma/presentation/screens/auth_screen/auth_screen.dart';
import 'package:pharma/presentation/screens/auth_screen/sign_up_screen.dart';
import 'package:pharma/presentation/screens/main_screen/main_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/will_pop_scope_handler.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/authentication_bloc/authentication_event.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    return WillPopScope(
              onWillPop: () => WillPopScopeHandler.handle(context),
         child:  BlocConsumer<AuthenticationBloc, AuthenticationState>(

           listener: (context, state) {
             if (state.isLoading) {
               LoadingDialog().openDialog(context);
             }
             else {
               LoadingDialog().closeDialog(context);
             }
             if (state.error != null) {
               ErrorDialog.openDialog(context, state.error);
             }
           },
           buildWhen: (previous, current) {
             return false;
           },
           builder: (context, state) => Scaffold(
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageManager.account),
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
                            Text(AppLocalizations.of(context)!.welcome,
                                style:
                                    getBoldStyle(color: Colors.white, fontSize: 29)),
                            const SizedBox(
                              height: 67,
                            ),
                            ButtonAuth(
                                label:
                                    AppLocalizations.of(context)!.new_subscription,
                            onTap: (){
                              AppRouter.push(context, const SignUpScreen(),);
                            }),
                            const SizedBox(
                              height: 27,
                            ),
                            ButtonAuth(
                                label: AppLocalizations.of(context)!.sign_in,
                                onTap: () {
                                  AppRouter.push(context, const AuthScreen(),);

                                }),
                            const SizedBox(
                              height: 27,
                            ),
                            ButtonAuth(
                                label: AppLocalizations.of(context)!.login_guest,  onTap: () {
                              sl<AuthenticationBloc>().add(LoggedGuest());
                              AppRouter.push(context, const MainScreen(),);
                            }
                            ),
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
      ),
         ),
       )
    ;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
