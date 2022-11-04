// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import '../../bloc/cubit/cubit.dart';
// import '../../shared/theme/theme.dart';
// import '../../translations/locale_keys.dart';
//
// class BmiModule extends StatelessWidget {
//   const BmiModule({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var heightValue = 170;
//     var ageValue = 20;
//     var weightValue = 170;
//     var isMale = false;
//     return SafeArea(
//       child: Column(
//         children: [
//
//          / selected gender of user male or female
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(pPadding),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onDoubleTap: () {
//                         BmiCubit
//                             .get(context)
//                             .isMale = false;
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: BmiCubit
//                               .get(context)
//                               .isMale
//                               ? Color(0xFF1B2558)
//                               : Color(0xFF1A1F38),
//                           borderRadius: BorderRadius.circular(pBorderSize),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.female,
//                               size: pIconSize,
//                               color: BmiCubit
//                                   .get(context)
//                                   .pColorIcon,
//                             ),
//                             const SizedBox(height: pBoxSize),
//                             Text(LocaleKeys.woman.tr()),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: pPadding,
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () =>
//                       BmiCubit
//                           .get(context)
//                           .isMale = true,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: BmiCubit
//                               .get(context)
//                               .sColor,
//                           borderRadius: BorderRadius.circular(pBorderSize),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.male,
//                               size: pIconSize,
//                               color: BmiCubit
//                                   .get(context)
//                                   .pColorIcon,
//                             ),
//                             const SizedBox(height: pBoxSize),
//                             Text(LocaleKeys.man.tr()),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//          / selected height of user
//           Expanded(
//             child: Padding(
//               note here I not use (EdgeInsets.all) because when use
//               (EdgeInsets.all) will adding padding of Selected gender part
//               to select Selected your height part
//               when do this padding will be 40 not 20
//               padding: const EdgeInsets.symmetric(horizontal: pPadding),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: BmiCubit
//                       .get(context)
//                       .sColor,
//                   borderRadius: BorderRadius.circular(pBorderSize),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       LocaleKeys.height.tr(),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.baseline,
//                       textBaseline: TextBaseline.alphabetic,
//                       children: [
//                         Text(
//                           '${BmiCubit
//                               .get(context)
//                               .heightValue}',
//                           style: const TextStyle(
//                             fontSize: pLargeFontSize,
//                           ),
//                         ),
//                         const Text('cm'),
//                       ],
//                     ),
//                     Slider(
//                       max: 250,
//                       min: 30,
//                       activeColor: BmiCubit
//                           .get(context)
//                           .pColor,
//                       inactiveColor: BmiCubit
//                           .get(context)
//                           .gSliderInactiveColor,
//                       label:
//                       BmiCubit
//                           .get(context)
//                           .heightValue
//                           .round()
//                           .toString(),
//                       value: BmiCubit
//                           .get(context)
//                           .heightValue
//                           .toDouble(),
//                       onChanged: BmiCubit.get(context).changeSlider(155),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: pPadding,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: pPadding),
//               child: Row(
//                 children: [
//
//                  / selected age of user
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: BmiCubit
//                             .get(context)
//                             .sColor,
//                         borderRadius: BorderRadius.circular(pBorderSize),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             LocaleKeys.age.tr(),
//                             style: const TextStyle(fontSize: pMediumFontSize),
//                           ),
//                           Text(
//                             '${BmiCubit
//                                 .get(context)
//                                 .ageValue}',
//                             style: const TextStyle(fontSize: pLargeFontSize),
//                           ),
//                           const SizedBox(height: pBoxSize),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   BmiCubit
//                                       .get(context)
//                                       .ageValue--;
//                                 },
//                                 heroTag: 'ageValue--',
//                                 mini: true,
//                                 backgroundColor: BmiCubit
//                                     .get(context)
//                                     .pColor,
//                                 child: const Icon(Icons.remove),
//                               ),
//                               const SizedBox(width: pBoxSize),
//                               FloatingActionButton(
//                                 onPressed: () {},
//                                 heroTag: 'ageValue++',
//                                 mini: true,
//                                 backgroundColor: BmiCubit
//                                     .get(context)
//                                     .pColor,
//                                 child: const Icon(Icons.add),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: pPadding,
//                   ),
//
//                  / selected weight of user
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: BmiCubit
//                             .get(context)
//                             .sColor,
//                         borderRadius: BorderRadius.circular(pBorderSize),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           FittedBox(
//                             child: Text(
//                               LocaleKeys.weight.tr(),
//                               style: const TextStyle(fontSize: pMediumFontSize),
//                             ),
//                           ),
//                           Text(
//                             '${BmiCubit
//                                 .get(context)
//                                 .weightValue}',
//                             style: const TextStyle(fontSize: pLargeFontSize),
//                           ),
//                           const SizedBox(height: pBoxSize),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   BmiCubit
//                                       .get(context)
//                                       .weightValue--;
//                                 },
//                                 heroTag: 'weightValue--',
//                                 mini: true,
//                                 backgroundColor: BmiCubit
//                                     .get(context)
//                                     .pColor,
//                                 child: const Icon(Icons.remove),
//                               ),
//                               const SizedBox(width: pBoxSize),
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   BmiCubit
//                                       .get(context)
//                                       .weightValue++;
//                                 },
//                                 heroTag: 'weightValue++',
//                                 mini: true,
//                                 backgroundColor: BmiCubit
//                                     .get(context)
//                                     .pColor,
//                                 child: const Icon(Icons.add),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: pPadding,
//           ),
//           to give my BMI
//           Container(
//             width: double.infinity,
//             height: 50,
//             child: MaterialButton(
//               color: gColorButton,
//               child: Center(
//                 child: Text(
//                   LocaleKeys.calculate.tr(),
//                   style: TextStyle(color: BmiCubit.get(context).pColorText),
//                 ),
//               ),
//               onPressed: () {
//                 double result = weightValue / pow(heightValue / 100, 2);
//                 go to next screen (ResultScreen)
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     passing this data (ResultScreen)
//                     builder: (context) => ResultScreen(
//                       age: ageValue,
//                       height: heightValue,
//                       gender: isMale,
//                       weight: weightValue,
//                       result: result,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
