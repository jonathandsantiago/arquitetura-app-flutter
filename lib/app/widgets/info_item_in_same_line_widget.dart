import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/widgets/info_item_widget.dart';
import 'package:flutter/material.dart';

class InfoItemInSameLineWidget extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;
  final bool valueRed1;
  final bool valueRed2;

  const InfoItemInSameLineWidget({
    super.key,
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
    this.valueRed1 = false,
    this.valueRed2 = false,
  });

  @override
  Widget build(BuildContext context) {
    var red = TextStyle(
      color: ThemeApp.of(context).alternate,
      fontWeight: FontWeight.w500,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: InfoItemWidget(
            label: label1,
            value: value1,
            valueTextStyle: valueRed1 ? red : null,
          ),
        ),
        Expanded(
          child: InfoItemWidget(
            label: label2,
            value: value2,
            valueTextStyle: valueRed2 ? red : null,
          ),
        ),
      ],
    );
  }
}
