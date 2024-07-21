import 'package:flutter/material.dart';

import '../theme/theme.dart';

PreferredSizeWidget appBarWidget({
  String? title,
  required bool isLeading,
  IconData? leadingIconData,
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

Widget pSizeBoxWidth10() => const SizedBox(width: 10);
Widget pSizeBoxWidth15() => const SizedBox(width: 15);
Widget pSizeBoxHeight20() => const SizedBox(height: 20);

