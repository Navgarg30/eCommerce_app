// import 'package:amazon_clone/features/admin/models/sales.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// //import 'package:fl_chart/fl_chart.dart' as charts;
// import 'package:flutter/material.dart';

// class CategoryProductsChart extends StatelessWidget {
//   final List<charts.Series<Sales, String>> seriesList;
//   const CategoryProductsChart({
//     Key? key,
//     required this.seriesList,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return charts.BarChart(
//       seriesList,
//       animate: true,
//     );
//   }
// }

import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> salesData;
  const CategoryProductsChart({
    Key? key,
    required this.salesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: salesData.map((data) {
          return BarChartGroupData(
            x: salesData.indexOf(data),
            barRods: [
              BarChartRodData(
                toY: data.earning
                    .toDouble(), // Use `earning` field for the value
                color: Colors.blue,
              ),
            ],
          );
        }).toList(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                return Text(salesData[index]
                    .label); // Use `label` field for the category name
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
