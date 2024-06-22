import 'package:flutter/material.dart';

import '../theme/theme.dart';

PreferredSizeWidget appBarWidget({
  String? title,
  required bool isLeading,
   leadingIconData,
  Function()? leadingFunction,
}) =>
    AppBar(
      title: Text(
        '$title',
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      leading: isLeading
          ? IconButton(
              icon: Icon(
                leadingIconData,
                color: pColorButtonIcon,
              ),
              onPressed: leadingFunction,
            )
          : null,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: pColor,
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget pSizeBoxHeight20() => SizedBox(height: 20);

Widget pSizeBoxWidth10() => const SizedBox(width: 10);