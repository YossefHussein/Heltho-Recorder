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
