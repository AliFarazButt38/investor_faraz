
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'line_tiles.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    Color(0xffC3EBFF),
    Color(0xff2573EF),

  ];

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      titlesData: LineTitles.getTitleData(),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Palette.lightBlue,
            strokeWidth: 1,
          );
        },
        drawVerticalLine: false,
        drawHorizontalLine: false,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Palette.lightBlue,
            strokeWidth: 0.5,
          );
        },
      ),
      borderData: FlBorderData(
        show: false,
        border: Border(
          left: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(2.6, 2),
            FlSpot(4.9, 3),
            FlSpot(6.8, 4),
            FlSpot(8, 5),
            FlSpot(9.5, 6),
            FlSpot(11, 7),
          ],
          isCurved: true,
          curveSmoothness: 0.4,
          colors: gradientColors,
          barWidth: 1,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    ),
  );
}