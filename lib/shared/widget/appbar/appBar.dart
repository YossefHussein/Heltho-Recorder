import 'package:flutter/material.dart';

import '../../theme/theme.dart';

PreferredSizeWidget appBarWidget({
  String? title,
  required bool isLeading,
  IconData? leadingIconData,
  Function()? leadingFunction,
}) {
  return AppBar(
    title: Text(
      '$title',
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    leading: isLeading
        ? IconButton(
            icon: Icon(
              leadingIconData,
              color: pColorIcon,
            ),
            onPressed: leadingFunction,
          )
        : null,
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: pColor,
  );
}
