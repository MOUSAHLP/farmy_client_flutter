import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/models/attribute_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/counter_box.dart';

class AboutProductAndAmonutSection extends StatelessWidget {
  final String productName;
  final String productDesc;
  final List<AttrbiuteResponse> attributeList;

  const AboutProductAndAmonutSection(
      {super.key,
      required this.productName,
      required this.productDesc,
      required this.attributeList,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSizeApp.s15,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: HtmlWidget(
                            productDesc,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: ColorManager.grayForMessage,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //todo attr product
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            attributeList.isNotEmpty
                ? Text(attributeList[0].value,
                    style: getBoldStyle(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s15,
                    ))
                : const SizedBox(),
            attributeList.length > 1
                ? Text(" / ${attributeList[1].value}",
                    style: getBoldStyle(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s15,
                    ))
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCountWidget(
              myIcon: Icons.add,
              onTap: () {
                context.read<ProductdetailsBloc>().add(
                      AddQuntityToOrder(
                        context.read<ProductdetailsBloc>().state.quntity!,
                      ),
                    );
              },
            ),
            const SizedBox(
              width: 18,
            ),
            InnerShadow(
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(
                    0.25,
                  ),
                  blurRadius: 10,
                  offset: const Offset(
                    2,
                    5,
                  ),
                )
              ],
              child: Container(
                height: 38,
                width: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        state.quntity.toString(),
                        style: getUnderBoldStyle(
                          color: ColorManager.primaryGreen,
                          fontSize: FontSizeApp.s24,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            CustomCountWidget(
              myIcon: Icons.remove,
              onTap: () {
                context.read<ProductdetailsBloc>().add(
                      RemoveQuntityToOrder(
                        context.read<ProductdetailsBloc>().state.quntity!,
                      ),
                    );
              },
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
