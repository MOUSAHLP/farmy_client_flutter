import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/details_order_bloc/details_order_event.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/screens/order_details_screen/widgets/card_details_order.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../../bloc/details_order_bloc/details_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/formatter.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../base_screen/base_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int id;
  final bool isEdit;
  final bool isDelivery;

  const OrderDetailsScreen({
    super.key,
    required this.id,
    this.isEdit = false,
    this.isDelivery = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<DetailsOrderBloc>()..add(ShowDetailsOrder(id: id));
      },
      child: OrderDetailsBody(id: id, isEdit: isEdit, isDelivery: isDelivery),
    );
  }
}

class OrderDetailsBody extends StatelessWidget {
  final int id;
  final bool isEdit;
  final bool isDelivery;

  const OrderDetailsBody(
      {super.key,
      required this.id,
      this.isEdit = false,
      this.isDelivery = false});

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      backgroundColor: Colors.white,
      appbarTitle: AppLocalizations.of(context)!.order_details,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                AppLocalizations.of(context)!.payment_statment,
                style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s16,
                ),
              ),
            ),
            BlocConsumer<DetailsOrderBloc, DetailsOrderState>(
              listener: (context, state) {
                if (state.isLoadingEdite) {
                  LoadingDialog().openDialog(context);
                } else {
                  LoadingDialog().closeDialog(context);
                }
                if (state.errorEdit != "") {
                  ErrorDialog.openDialog(context, state.errorEdit);
                }
                if (state.successEdit) {}
              },
              builder: (context, state) {
                if (state.screenStates == ScreenStates.loading) {
                  return const Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: ColorManager.primaryGreen,
                  )));
                } else if (state.screenStates == ScreenStates.error) {
                  return Expanded(
                    child: CustomErrorScreen(
                      onTap: () {
                        context
                            .read<DetailsOrderBloc>()
                            .add(ShowDetailsOrder(id: id));
                      },
                      titleError: state.error,
                    ),
                  );
                }
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomOverscrollIndicator(
                          child: ListView.builder(
                            itemBuilder: (context, index) => CardDetailsOrder(
                                product: state.productList[index],
                                isEdit: isEdit),
                            itemCount: state.productList.length,
                          ),
                        ),
                      ),
                      state.productList.isEmpty
                          ? const SizedBox()
                          : Container(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22)),
                                  boxShadow: [ColorManager.shadowGaryUp]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .total_price_without_delivery_with_tax,
                                    style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          Formatter.formatPrice(
                                              state.totalPrice),
                                          style: getBoldStyle(
                                              color: ColorManager.primaryGreen,
                                              fontSize: 24)),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                          AppLocalizations.of(context)!
                                              .curruncy,
                                          style: getBoldStyle(
                                                  color:
                                                      ColorManager.primaryGreen,
                                                  fontSize: 15)!
                                              .copyWith(height: 1))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27, vertical: 9),
                                    child: Row(
                                      children: [
                                        isEdit
                                            ? Expanded(
                                                child: CustomButton(
                                                  label: AppLocalizations.of(
                                                          context)!
                                                      .save_edits,
                                                  fillColor:
                                                      ColorManager.primaryGreen,
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            DetailsOrderBloc>()
                                                        .add(EditDetailsOrder(
                                                            id: id));
                                                  },
                                                ),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            label: AppLocalizations.of(context)!
                                                .back,
                                            fillColor:
                                                ColorManager.primaryGreen,
                                            labelColor: Colors.white,
                                            onTap: () {
                                              AppRouter.pop(context);
                                            },
                                          ),
                                        ),
                                        isEdit
                                            ? const SizedBox()
                                            : const SizedBox(
                                                width: 16,
                                              ),
                                        !isDelivery
                                            ? const SizedBox()
                                            : Expanded(
                                                child: CustomButton(
                                                  label: AppLocalizations.of(
                                                          context)!
                                                      .download_pdf,
                                                  fillColor: Colors.white,
                                                  isFilled: true,
                                                  borderColor:
                                                      ColorManager.primaryGreen,
                                                  labelColor:
                                                      ColorManager.primaryGreen,
                                                  onTap: () {
                                                    launchUrl(
                                                      Uri.parse(state.urlPdf),
                                                      mode: LaunchMode
                                                          .externalApplication,
                                                    );
                                                  },
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      //  drawer: const CustomAppDrawer(),
    );
  }
}
