// import 'package:flutter/material.dart';
// import 'package:pharma/presentation/resources/assets_manager.dart';
// import 'package:pharma/presentation/resources/color_manager.dart';
// import 'package:pharma/presentation/resources/font_app.dart';
// import 'package:pharma/presentation/resources/style_app.dart';
// import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
//
// class AboutTheAppcreen extends StatelessWidget {
//   const AboutTheAppcreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         children: [
//           const CustomAppBarScreen(sectionName: "حول التطبيق"),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(vertical: 74),
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                         height: 139,
//                         width: 139,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             gradient: const LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   ColorManager.primaryGreen,
//                                   ColorManager.softGreen
//                                 ])),
//                         child: Image.asset(ImageManager.logoAboutApp)),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SizedBox(
//                   height: 244,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "تطبيق فارمي ",
//                             style: getBoldStyle(
//                                 color: ColorManager.grayForMessage,
//                                 fontSize: FontSizeApp.s15),
//                           ),
//                           Text(
//                             "Android V1.1.2 ",
//                             style: getBoldStyle(
//                                 color: ColorManager.grayForMessage,
//                                 fontSize: FontSizeApp.s15),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "جميع الحقوق محفوظة لشركة فارمي (farmy)ⓒ",
//                         style: getBoldStyle(
//                             color: ColorManager.grayForMessage,
//                             fontSize: FontSizeApp.s14),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';

import '../../../../translations.dart';
import '../../../bloc/about_bloc/about_bloc.dart';
import '../../../bloc/about_bloc/about_event.dart';
import '../../../bloc/about_bloc/about_state.dart';
import '../../widgets/custom_app_bar_screen.dart';

class AboutTheAppcreen extends StatelessWidget {
  const AboutTheAppcreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AboutBloc>(
      lazy: true,
      create: (BuildContext context) => sl<AboutBloc>()..add(GetAbout()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.about_Application,
                isComeBack: true,
              ),
              Padding(
                padding: const EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<AboutBloc, AboutState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FAQError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<AboutBloc>().add(GetAbout());
                          },
                        );
                      }
                      if (state is FAQSuccess) {
                        String html = context.read<AboutBloc>().faqModel!.data!.html!;
                        return Center(
                          child: HtmlWidget(html),
                        );
                      }
                      return const CustomLoadingWidget();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
