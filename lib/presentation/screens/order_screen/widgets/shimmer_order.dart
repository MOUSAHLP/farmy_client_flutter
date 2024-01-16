import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildShimmerOrders extends StatelessWidget {
  const BuildShimmerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10),
      child: SizedBox(
        child: ListView.builder(

          itemBuilder: (context, index) =>  Shimmer.fromColors(
            baseColor: const Color(0xFFd3d7de),
            highlightColor: const Color(0xFFe2e4e9),
            child:  Card(
              elevation: 0.0,
              color: const Color.fromRGBO(45, 45, 45, 1.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: SizedBox(
                width: 1.sw,
                height: 170,
              ),
            ),
          ),

        ),
      ),
    );
  }

}
