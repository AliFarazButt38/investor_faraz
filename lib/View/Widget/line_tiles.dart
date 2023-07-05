import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    leftTitles: SideTitles(
      showTitles: false,
      getTextStyles: (BuildContext context, double value) =>
      const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      getTitles: (double value) {
        switch (value.toInt()) {
          case 1:
            return '100';
          case 3:
            return '500';
          case 5:
            return '1000';
        }
        return '';
      },
      reservedSize: 35,
      margin: 12,
    ),
    bottomTitles: SideTitles(
      showTitles: false,
      getTextStyles: (BuildContext context, double value) =>
      const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      getTitles: (double value) {
        switch (value.toInt()) {
          case 1:
            return '01:00';
          case 6:
            return '06:00';
          case 10:
            return '10:00';
        }
        return '';
      },
      reservedSize: 35,
      margin: 8,
    ),
  );
}