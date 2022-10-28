import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../translations/locale_keys.dart';
import '../../theme/theme.dart';

class GenderWidget extends StatefulWidget {
  late bool isMale;
  late Function? functionGender;
  IconData? iconGender;
  GenderWidget({
    Key? key,
    required isMale,
    required iconGender,
    this.functionGender,
  }) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(pPadding),
        child: GestureDetector(
          onTap: () => widget.functionGender!(),
          child: Container(
            decoration: BoxDecoration(
              color: widget.isMale ? pColor : sColor,
              borderRadius: BorderRadius.circular(pBorderSize),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.iconGender,
                  size: pIconSize,
                  color: pColorIcon,
                ),
                const SizedBox(height: pBoxSize),
                Text(LocaleKeys.woman.tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/**
 setState(() {
            widget.isMale = true;
          }),
 * 
 * 
 */