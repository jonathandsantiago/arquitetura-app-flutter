import 'package:seedapp/app/core/theme_app.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartItem> itens;

  const BarChartWidget({super.key, required this.itens});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: MediaQuery.of(context).size.height * 0.004,
          ),
          child: Divider(
            thickness: 0.6,
            color: ThemeApp.of(context).secondary.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: MediaQuery.of(context).size.height * 0.045,
          ),
          child: Divider(
            thickness: 0.6,
            color: ThemeApp.of(context).secondary.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: MediaQuery.of(context).size.height * 0.085,
          ),
          child: Divider(
            thickness: 0.6,
            color: ThemeApp.of(context).secondary.withOpacity(0.3),
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 6,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: DChartBarCustom(
              loadingDuration: const Duration(milliseconds: 1500),
              showLoading: true,
              valueAlign: Alignment.topCenter,
              showDomainLine: true,
              spaceBetweenItem: 50,
              domainLineStyle: BorderSide(
                color: ThemeApp.of(context).lineColor.withOpacity(0.3),
                width: 1.5,
              ),
              listData: itens
                  .map((e) => DChartBarDataCustom(
                        value: e.value,
                        label: '',
                        showValue: true,
                        valueCustom: Center(
                          child: Text(
                            '${e.value.toInt()}',
                            style: ThemeApp.of(context).legenda.override(
                                  color: e.colorLabel ??
                                      ThemeApp.of(context).secondary,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        color: e.color,
                      ))
                  .toList(),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            children: itens
                .map((e) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            color: e.color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              e.title,
                              textAlign: TextAlign.center,
                              style: ThemeApp.of(context).legenda.override(
                                    color: ThemeApp.of(context).primaryBtnText,
                                  ),
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class BarChartItem {
  late String title;
  late double value;
  late Color color;
  late Color? colorLabel;

  BarChartItem({
    required this.title,
    required this.value,
    required this.color,
    this.colorLabel,
  });
}
