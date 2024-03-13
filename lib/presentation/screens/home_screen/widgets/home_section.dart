import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/utils/app_value_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

import '../../../../models/product_details_response.dart';

class HomeSection extends StatelessWidget {
  final Map<String, dynamic> title;
  final List<ProductResponse> list;

  const HomeSection({Key? key, required this.list, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appLang = DataStore.instance.lang;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppValueConst.homeVerticalPadding),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 0),
            child: CustomSectionName(
              sectionName: title[appLang] ??
                  AppLocalizations.of(context)!.suggested_products,
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 260.h,
            width: 1.sw,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppRouter.push(
                      context,
                      ProductDetailsScreen(
                        id: list[index].id,
                        quantity: list[index].quantity ?? 0,
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        bottom: 0, start: index == 0 ? 0 : 15),
                    child: CustomProductCard(
                      productInfo: list[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
