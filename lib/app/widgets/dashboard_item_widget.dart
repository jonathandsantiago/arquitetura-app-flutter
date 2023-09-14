import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/widgets.dart';

class DashboardItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const DashboardItemWidget(
      {super.key,
      this.color,
      required this.title,
      required this.value,
      required this.height,
      required this.width,
      this.margin,
      this.titleStyle,
      this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.only(left: 15, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: ThemeApp.of(context).secondary.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: ThemeApp.of(context).primary,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ??
                  ThemeApp.of(context).legenda.override(
                        fontWeight: FontWeight.w700,
                        color: color ?? ThemeApp.of(context).secondary,
                      ),
              maxLines: 1,
            ),
          ),
          Center(
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: valueStyle ??
                  ThemeApp.of(context).subtitulo.override(
                        fontWeight: FontWeight.normal,
                        color: color ?? ThemeApp.of(context).secondary,
                      ),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
