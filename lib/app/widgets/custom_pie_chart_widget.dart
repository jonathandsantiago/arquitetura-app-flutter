import 'package:seedapp/app/core/theme_app.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieWidgetChart extends StatelessWidget {
  final List<PieData> data;

  const CustomPieWidgetChart({super.key, required this.data});

  List<PieChartSectionData> generatePieData() {
    return data.map((item) {
      return PieChartSectionData(
        color: item.color,
        value: item.value,
        title: '${item.value.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
        titlePositionPercentageOffset: 0.55,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 18),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: ThemeApp.of(context).secondary.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ThemeApp.of(context).primary,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 140,
              child: PieChart(
                PieChartData(
                  sections: generatePieData(),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  centerSpaceRadius: 0,
                  sectionsSpace: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: data
                        .map(
                          (e) => Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                width: 16,
                                height: 16,
                                color: e.color,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  e.description,
                                  style:
                                      ThemeApp.of(context).subtitulo.override(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieData {
  final String description;
  final double value;
  final Color color;

  PieData(
      {required this.description, required this.value, required this.color});
}
