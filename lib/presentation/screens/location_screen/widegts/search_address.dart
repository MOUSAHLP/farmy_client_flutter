import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/location_bloc/location_bloc.dart';
import '../../../../bloc/location_bloc/location_event.dart';
import '../../../../translations.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/style_app.dart';
class SearchAddress extends StatefulWidget {
  const SearchAddress({
    Key? key,
    this.label,
  }) : super(key: key);

  final String? label;

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  late  TextEditingController controller ;
  @override
  void initState() {
    controller=TextEditingController();
    controller.addListener(() {
      if (controller.text.length == 1) {
        setState(() {
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                     width: MediaQuery.of(context).size.width ,

                      child: Expanded(
                        child: TextFormField(
                          style: getRegularStyle(color: ColorManager.primaryGreen),
                          controller: controller,
                          minLines: 1,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            context.read<LocationBloc>().add(
                                SearchByKeyword(keyword: value));
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFEEF6F6),
                            hintText:
                                AppLocalizations.of(context)!
                                    .choose_favorite_address,
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,

                            labelStyle: getRegularStyle(
                                color: Colors.white),
                            hintStyle: getBoldStyle(
                              color: ColorManager.grayForSearch,
                            ),
                            border: const UnderlineInputBorder(

                              borderSide:  BorderSide(
                                color: Colors.grey,
                              )
                            ),
                            enabledBorder:
                                const UnderlineInputBorder(

                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                            focusedBorder:
                                const UnderlineInputBorder(

                              borderSide:  BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
