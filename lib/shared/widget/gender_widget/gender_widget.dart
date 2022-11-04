// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../../../bloc/cubit/cubit.dart';
// import '../../../translations/locale_keys.dart';
// import '../../theme/theme.dart';

// /**
//  setState(() {
//             widget.isMale = true,
//           }),
//  * 
//  * 
//  */

// /// selected gender of user male or female
// Widget GenderWidget({
//   required bool isMale,
//   String? genderType,
//   Function? function,
//   IconData? genderIcon,
// }) {
//   return Expanded(
//     child: GestureDetector(
//       onTap: () => isMale = true,
//       child: Container(
//         decoration: BoxDecoration(
//           color: isMale ? BmiCubit.get(context).pColor : BmiCubit.get(context).sColor,
//           borderRadius: BorderRadius.circular(pBorderSize),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: pBoxSize,
//             ),
//             Icon(
//               genderIcon,
//               size: pIconSize,
//               color: pColorIcon,
//             ),
//             SizedBox(
//               height: pBoxSize,
//             ),
//             Text(
//               isMale == false ? LocaleKeys.woman.tr() : LocaleKeys.man.tr(),
//               style: TextStyle(
//                 color: pColorText,
//               ),
//             ),
//             SizedBox(
//               height: pBoxSize,
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
