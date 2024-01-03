import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

import 'package:pharma/presentation/resources/color_manager.dart';

import 'package:pharma/presentation/screens/home_screen/widgets/custom_home_cursel.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:shimmer/shimmer.dart';

class CustomHomeShimmer extends StatelessWidget {
  const CustomHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                child: Shimmer.fromColors(
                  baseColor: ColorManager.grayForPlaceholde,
                  highlightColor: const Color(0xFFe2e4e9),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(
                          left: BorderSide(color: ColorManager.grayForMessage),
                          right: BorderSide(color: ColorManager.grayForMessage),
                          top: BorderSide(
                              color: ColorManager
                                  .grayForMessage), // White border at the top
                          bottom: BorderSide(
                              color: ColorManager
                                  .grayForMessage), // White border at the bottom
                        )),
                    width: 1.sw,
                    height: 61,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Shimmer.fromColors(
                  baseColor: ColorManager.grayForPlaceholde,
                  highlightColor: const Color(0xFFe2e4e9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 1.sw,
                      height: 61,
                      color: ColorManager.lightGray,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 13),
                child: SizedBox(
                  height: 214,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 97,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: ColorManager.grayForPlaceholde,
                        highlightColor: const Color(0xFFe2e4e9),
                        child: const CustomCategory(
                          textHieght: 0,
                          categoryName: "",
                        ),
                      );
                    },
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: ColorManager.grayForPlaceholde,
                highlightColor: const Color(0xFFe2e4e9),
                child: CustomHomeCursel(
                  isLoadingState: true,
                  verticalPadding: 0,
                  height: 0.5.sw,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: SizedBox(
                  height: 238,
                  width: 1.sw,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 10, start: index == 0 ? 0 : 15),
                          child: Shimmer.fromColors(
                            baseColor: ColorManager.grayForPlaceholde,
                            highlightColor: const Color(0xFFe2e4e9),
                            child: CustomProductCard(
                                isSellerFound: false,
                                isDisCount: false,
                                productInfo: ProductsBySubCategoryIdResponse(
                                    availabilityOfProduct: "",
                                    discount: "",
                                    nameOfProduct: "",
                                    price: "",
                                    quantity: "",
                                    sellerName: "")),
                          ));
                    },
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: ColorManager.grayForPlaceholde,
                highlightColor: const Color(0xFFe2e4e9),
                child: CustomHomeCursel(
                  isLoadingState: true,
                  verticalPadding: 0,
                  height: 0.5.sw,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: SizedBox(
                  height: 238,
                  width: 1.sw,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 10, start: index == 0 ? 0 : 15),
                          child: Shimmer.fromColors(
                            baseColor: ColorManager.grayForPlaceholde,
                            highlightColor: const Color(0xFFe2e4e9),
                            child: CustomProductCard(
                                isSellerFound: false,
                                isDisCount: false,
                                productInfo: ProductsBySubCategoryIdResponse(
                                    availabilityOfProduct: "",
                                    discount: "",
                                    nameOfProduct: "",
                                    price: "",
                                    quantity: "",
                                    sellerName: "")),
                          ));
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
