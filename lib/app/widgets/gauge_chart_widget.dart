import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/widgets.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class GaugeChartWidget extends StatelessWidget {
  final double value;
  final String legend;
  final Color color;
  final Color background;
  final TextStyle? valueStyle;
  final TextStyle? legendStyle;

  const GaugeChartWidget({
    super.key,
    required this.value,
    required this.legend,
    this.valueStyle,
    this.legendStyle,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: AnimatedRadialGauge(
            duration: const Duration(seconds: 1),
            curve: Curves.elasticOut,
            radius: 100,
            value: value,
            builder: (context, child, value) => Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  '${value.toInt()}%',
                  textAlign: TextAlign.center,
                  style: valueStyle ??
                      ThemeApp.of(context).subtitulo.override(
                            color: ThemeApp.of(context).primaryBtnText,
                            fontWeight: FontWeight.w700,
                          ),
                  maxLines: 1,
                ),
              ),
            ),
            axis: GaugeAxis(
              min: 0,
              max: 100,
              degrees: 180,
              style: GaugeAxisStyle(
                thickness: 20,
                background: background,
                segmentSpacing: 5,
                cornerRadius: Radius.zero,
              ),
              pointer: null,
              progressBar: GaugeProgressBar.basic(
                color: color,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            width: 120,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              legend,
              textAlign: TextAlign.center,
              style: legendStyle ??
                  ThemeApp.of(context).legenda.override(
                        fontWeight: FontWeight.w600,
                        color: ThemeApp.of(context).primaryBtnText,
                      ),
              maxLines: 2,
            ),
          ),
        )
      ],
    );
  }
}
