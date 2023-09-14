import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?> onChanged;
  final String? title;
  final TextStyle? titleStyle;

  const CheckBoxWidget(
      {super.key,
      this.value,
      required this.onChanged,
      this.title,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return ThemeApp.of(context).primaryBtnText;
            },
          ),
        ),
        title != null
            ? Text(title!, style: titleStyle ?? ThemeApp.of(context).descricao)
            : const SizedBox.shrink()
      ],
    );
  }
}
