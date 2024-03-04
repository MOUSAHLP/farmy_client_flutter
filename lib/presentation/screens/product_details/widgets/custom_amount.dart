import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/product_details/widgets/counter_box.dart';

class CustomAmount extends StatelessWidget {
  final ProductdetailsEvent addEvent;
  final ProductdetailsEvent removeEvent;
  final String quantityString;

  const CustomAmount({
    Key? key,
    required this.addEvent,
    required this.removeEvent,
    required this.quantityString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: Directionality.of(context) == TextDirection.rtl ? 22 : 0,
        left: Directionality.of(context) == TextDirection.ltr ? 22 : 0,
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              height: 25,
              width: 30,
              child: CustomCountWidget(
                height: 25,
                width: 30,
                myIcon: Icons.add,
                onTap: () {
                  context.read<ProductdetailsBloc>().add(addEvent);
                },
              ),
            ),
            const SizedBox(
              width: 9,
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
                height: 25,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        quantityString,
                        style: getUnderBoldStyle(
                          color: ColorManager.primaryGreen,
                          fontSize: FontSizeApp.s20,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              height: 25,
              width: 30,
              child: CustomCountWidget(
                height: 25,
                width: 30,
                myIcon: Icons.remove,
                onTap: () {
                  context.read<ProductdetailsBloc>().add(removeEvent);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
