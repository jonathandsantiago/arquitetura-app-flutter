import 'package:seedapp/app/core/theme_app.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class SingleBarChartWidget extends StatelessWidget {
  final double value;
  final String title;
  final Color color;
  final double? height;
  final double? heightText;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const SingleBarChartWidget(
      {super.key,
      required this.value,
      required this.title,
      required this.color,
      this.height,
      this.heightText,
      this.padding,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height ?? 13,
              padding: const EdgeInsets.only(right: 5),
              child: DChartSingleBar(
                foregroundColor: color,
                backgroundColor: ThemeApp.of(context).secondaryBackground,
                value: value,
                max: 100,
              ),
            ),
          ),
          SizedBox(
            height: heightText,
            width: width ?? 145,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text(
                      '$value%',
                      textAlign: TextAlign.center,
                      style: ThemeApp.of(context).legenda.override(
                            color: color,
                            fontWeight: FontWeight.w700,
                          ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: ThemeApp.of(context).legenda.override(
                            color: ThemeApp.of(context).primaryBtnText,
                            fontWeight: FontWeight.w700,
                          ),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
