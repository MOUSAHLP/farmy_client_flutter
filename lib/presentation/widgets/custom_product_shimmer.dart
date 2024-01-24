import 'package:flutter/cupertino.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:shimmer/shimmer.dart';

class CustomProductShimmer extends StatelessWidget {
  const CustomProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: 144 / 233,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 26,
          mainAxisExtent: 227),
      itemBuilder: (context, index) {
        return Center(
            child: Shimmer.fromColors(
          baseColor: ColorManager.grayForPlaceholder,
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
    );
  }
}
