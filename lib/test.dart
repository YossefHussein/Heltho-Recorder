
// class TestingScreen extends StatelessWidget {
//   const TestingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BmiMainCubit, BmiStates>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: FutureBuilder(
//             future: context.read<BmiMainCubit>().getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 List<Map<String, dynamic>> userData =
//                     snapshot.data as List<Map<String, dynamic>>;
//                 // Create a list of FlSpot for the x and y values (date and BMI)
//                 List<FlSpot> spots = userData.asMap().entries.map((entry) {
//                   return FlSpot(entry.key.toDouble(), entry.value['bmi']);
//                 }).toList();
//                 return Container(
//                   height: 180,
//                   child: LineChart(
//                     LineChartData(
//                       titlesData: const FlTitlesData(
//                           // leftTitlesShowBorder: true,
//                           // bottomTitlesShowBorder: true,
//                           // rightTitlesShowBorder: true,
//                           // topTitlesShowBorder: true,
//                           // leftTitles: SideTitles(showTitles: true),
//                           // bottomTitles: SideTitles(showTitles: true),
//                           ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(
//                             color: const Color(0xff37434d), width: 1),
//                       ),
//                       gridData: const FlGridData(
//                         show: true,
//                         drawHorizontalLine: true,
//                         drawVerticalLine: true,
//                       ),
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: spots,
//                           isCurved: true,
//                           color: Colors.blue,
//                           dotData: const FlDotData(show: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }

