
import 'package:flutter/material.dart';
import '../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../core/services/services_locator.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../translations.dart';

class FavoriteHeart extends StatelessWidget {
  const FavoriteHeart({
    Key? key,
    required this.id,
    required this.isToggled,
    required this.onTap,
  }) : super(key: key);
  final int id;
  final bool isToggled;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (sl<AuthenticationBloc>().loggedIn) {
          onTap();
        }else{
         toast(AppLocalizations.of(context)!.pleaseLogIn);
        }
      },
      child: Icon(
        color: isToggled
            ? Colors.red
            : Colors.black,
        isToggled
            ? Icons.favorite
            :
        Icons.favorite_border_outlined,
        size: 26,
      )
    );
  }
}
