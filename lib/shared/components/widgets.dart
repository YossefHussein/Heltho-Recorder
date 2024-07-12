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


Widget pSizeBoxWidth10() => const SizedBox(width: 10);
Widget pSizeBoxWidth15() => const SizedBox(width: 15);
Widget pSizeBoxHeight20() => const SizedBox(height: 20);

// class ChartBmiWidget extends StatelessWidget {
//   const ChartBmiWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//
//         LineChartData(
//           minX: 0,
//           maxX: 11,
//           minY: 6,
//           maxY: 0,
//           lineBarsData: [
//             LineChartBarData(
//               spots: [
//                 FlSpot(0, 3),
//                 FlSpot(0, 2),
//                 FlSpot(0, 5),
//                 FlSpot(0, 6),
//                 FlSpot(0, 9),
//                 FlSpot(0, 8),
//                 FlSpot(0, 9),
//               ]
//             )
//           ]
//         )
//     );
//   }
// }
