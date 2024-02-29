import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/presentation/screens/all_section/all_section_screen.dart';
import 'package:pharma/presentation/screens/all_section/widgets/test.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/translations.dart';

class HomeCategory extends StatelessWidget {
  final Map<String, String> title;
  final List<CategoriesResponse> categoriesList;
  const HomeCategory(
      {Key? key, required this.categoriesList, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appLang = DataStore.instance.lang;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppValueConst.homeVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 0),
            child: CustomSectionName(
              sectionName:
                  title[appLang] ?? AppLocalizations.of(context)!.sections,
              onTap: () {
                AppRouter.push(context, const ALlSectionScreen());
              },
            ),
          ),
          SizedBox(
            height: 140.h,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              itemCount: categoriesList.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 23,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 97,
                  crossAxisCount: 1),
              itemBuilder: (context, index) {
                return CustomCategory(
                  onTap: () {
                    AppRouter.push(context, const ALlSectionScreen());
                  },
                  categoryImage: categoriesList[index].imageUrl,
                  categoryName: categoriesList[index].name != null
                      ? categoriesList[index].name!
                      : "",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
