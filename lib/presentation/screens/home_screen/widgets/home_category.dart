import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/presentation/screens/all_section/all_section_screen.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/translations.dart';

class HomeCategory extends StatelessWidget {
  final Map<String, dynamic> title;
  final List<CategoriesResponse> categoriesList;

  const HomeCategory({
    Key? key,
    required this.categoriesList,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sortCategoriesResponse(categoriesList);
    String appLang = DataStore.instance.lang;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 33.w,
            vertical: 10.h,
          ),
          child: CustomSectionName(
            sectionName:
                title[appLang] ?? AppLocalizations.of(context)!.sections,
            onTap: () {
              context.read<CategoriesBloc>().add(
                    const GetSubCategoryEvent(
                      tabIndex: 0,
                      categoryId: 0,
                    ),
                  );
              AppRouter.push(
                context,
                ALlSectionScreen(
                  categoriesList: categoriesList,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 290.h,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            itemCount: categoriesList.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 23,
              mainAxisSpacing: 15,
              mainAxisExtent: 97,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return CustomCategory(
                onTap: () {
                  context.read<CategoriesBloc>().add(
                        GetSubCategoryEvent(
                          tabIndex: sortCategoriesResponseIndex(
                                      sortCategoriesResponse(categoriesList))[
                                  index] +
                              1,
                          categoryId:
                              sortCategoriesResponse(categoriesList)[index].id,
                        ),
                      );
                  AppRouter.push(
                    context,
                    ALlSectionScreen(
                      categoriesList: categoriesList,
                    ),
                  );
                },
                categoryImage:
                    sortCategoriesResponse(categoriesList)[index].imageUrl,
                categoryName:
                    sortCategoriesResponse(categoriesList)[index].name != null
                        ? sortCategoriesResponse(categoriesList)[index].name!
                        : "",
              );
            },
          ),
        )
      ],
    );
  }
}

List<CategoriesResponse> sortCategoriesResponse(
    List<CategoriesResponse> categoriesResponse) {
  int mid = (categoriesResponse.length + 1) ~/ 2;

  // تقسيم المصفوفة إلى نصفين
  List<CategoriesResponse> firstHalf = categoriesResponse.sublist(0, mid);
  List<CategoriesResponse> secondHalf = categoriesResponse.sublist(mid);

  // إنشاء مصفوفة جديدة بدمج العناصر
  List<CategoriesResponse> newArray = [];
  int minLength = firstHalf.length < secondHalf.length
      ? firstHalf.length
      : secondHalf.length;
  for (int i = 0; i < minLength; i++) {
    newArray.add(firstHalf[i]);
    newArray.add(secondHalf[i]);
  }

  // إضافة العناصر المتبقية إن وجدت
  if (firstHalf.length > minLength) {
    newArray.addAll(firstHalf.sublist(minLength));
  }
  if (secondHalf.length > minLength) {
    newArray.addAll(secondHalf.sublist(minLength));
  }

  return newArray;
}

List<int> sortCategoriesResponseIndex(
    List<CategoriesResponse> categoriesResponse) {
  int mid = (categoriesResponse.length + 1) ~/ 2;

  List<int> tmpList = [];
  for (int tmp = 0; tmp < categoriesResponse.length; tmp++) {
    tmpList.add(tmp);
  }
  // تقسيم المصفوفة إلى نصفين
  List<int> firstHalf = tmpList.sublist(0, mid);
  List<int> secondHalf = tmpList.sublist(mid);

  // إنشاء مصفوفة جديدة بدمج العناصر
  List<int> newArray = [];
  int minLength = firstHalf.length < secondHalf.length
      ? firstHalf.length
      : secondHalf.length;
  for (int i = 0; i < minLength; i++) {
    newArray.add(firstHalf[i]);
    newArray.add(secondHalf[i]);
  }

  // إضافة العناصر المتبقية إن وجدت
  if (firstHalf.length > minLength) {
    newArray.addAll(firstHalf.sublist(minLength));
  }
  if (secondHalf.length > minLength) {
    newArray.addAll(secondHalf.sublist(minLength));
  }

  return newArray;
}
