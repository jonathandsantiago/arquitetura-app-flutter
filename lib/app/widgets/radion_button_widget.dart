import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';

class RadionButtonWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String title;

  const RadionButtonWidget(
      {super.key,
      required this.value,
      this.groupValue,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return ThemeApp.of(context).primaryBtnText.withOpacity(0.8);
            }
            return ThemeApp.of(context).secondary;
          }),
          overlayColor: MaterialStateColor.resolveWith(
              (states) => ThemeApp.of(context).primaryBtnText),
          onChanged: onChanged,
        ),
        Text(title, style: ThemeApp.of(context).descricao),
      ],
    );
  }
}
