import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../bloc/search_bloc/search_bloc.dart';
import '../../../../bloc/search_bloc/search_event.dart';
import '../../../../bloc/search_bloc/search_state.dart';
import '../../../../core/app_enum.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../translations.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';

import '../../../resources/values_app.dart';
import '../../../widgets/custom_prdouct_card.dart';
import '../../product_details/product_details_screen.dart';


class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (BuildContext context) => sl<SearchBloc>(),
      child: const SearchVendorBody(),
    );
  }
}

class SearchVendorBody extends StatelessWidget {
  const SearchVendorBody({
    Key? key,
    this.label,
  }) : super(key: key);

  final String? label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarScreen(sectionName: ""),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.grayForSearch,
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<SearchBloc>()
                                      .add(SearchCategory());
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: ColorManager.primaryGreen,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    decoration: const BoxDecoration(

                                      color: ColorManager.grayForSearch,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: context
                                                .read<SearchBloc>()
                                                .searchController,
                                            minLines: 1,
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            onEditingComplete: () {
                                              context
                                                  .read<SearchBloc>()
                                                  .add(SearchCategory());
                                            },

                                            decoration: InputDecoration(
                                              fillColor:
                                              ColorManager.grayForSearch,
                                              hintText:
                                                  AppLocalizations.of(context)!
                                                      .searchForProduct,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              labelStyle: getRegularStyle(
                                                  color: Colors.white),
                                              hintStyle: getBoldStyle(
                                                color: Colors.grey,
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(28.0)),
                                                borderSide: BorderSide.none,
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(28.0)),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(28.0)),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<SearchBloc>()
                                      .searchController
                                      .clear();
                                  context
                                      .read<SearchBloc>()
                                      .pendingFilter
                                      .page = 0;
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: ColorManager.primaryGreen,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                if (state.screenStates == ScreenStates.loading &&
                    context.read<SearchBloc>().isFirstLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primaryGreen,
                  ));
                } else if (state.screenStates == ScreenStates.error) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state.screenStates == ScreenStates.initialized) {
                  return const SizedBox();
                } else {
                  return state.vendorsList.isEmpty
                      ? whenSearchResultEmpty(context)
                      :
                  LazyLoadScrollView(
                          onEndOfPage: () {
                            if (context.read<SearchBloc>().isLast == false) {
                              context
                                  .read<SearchBloc>()
                                  .add(SearchCategoryPage());
                            }
                          },
                          isLoading: !context.read<SearchBloc>().isLast,
                          child: GridView.builder(
                            itemCount: state.vendorsList.length,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          AppRouter.push(
                                            context,
                                            ProductDetailsScreen(
                                              id: state.vendorsList[index]
                                                  .id ,
                                              quantity: state.vendorsList[index].quantity,
                                            ),
                                          );
                                        },
                                        child: CustomProductCard(
                                          productInfo: state.vendorsList[index],
                                        ),
                                      ),
                                    ),
                                    state.screenStates == ScreenStates.loading &&
                                            index == state.vendorsList.length - 1
                                        ? Center(
                                            child: Shimmer.fromColors(
                                              baseColor: const Color(0xFFd3d7de),
                                              highlightColor:
                                                  const Color(0xFFe2e4e9),
                                              child: const Card(
                                                elevation: 0.0,
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 1.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .only(
                                                    topStart: Radius.circular(50),
                                                    bottomStart:
                                                        Radius.circular(50),
                                                  ),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: SizedBox(
                                                  width: 350,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              );
                            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 26,
                            mainAxisExtent: 230,
                          ),
                          ),
                        )
                  ;
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget whenSearchResultEmpty(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: PaddingApp.p30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageManager.placeholderLogo,
                      height:1.sh*0.24,
                      width:1.sw*0.44 ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.noResult,
                    style: getBoldStyle(
                        color: ColorManager.primaryGreen, fontSize: FontSizeApp.s18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
