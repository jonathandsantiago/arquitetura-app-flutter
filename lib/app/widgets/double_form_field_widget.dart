import 'package:seedapp/app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DoubleFormFieldWidget extends StatelessWidget {
  final String? label;
  final double? initialValue;
  final bool? readOnly;
  final Widget? icon;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? paddingHorizontal;

  const DoubleFormFieldWidget({
    Key? key,
    this.label,
    this.validator,
    this.readOnly,
    this.initialValue,
    this.icon,
    this.padding,
    this.maxLines,
    this.style,
    this.controller,
    this.paddingHorizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
        label: label,
        validator: validator,
        readOnly: readOnly,
        initialValue:
            initialValue == null ? null : initialValue!.toStringAsFixed(2),
        icon: icon,
        padding: padding,
        maxLines: maxLines,
        style: style,
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        paddingHorizontal: paddingHorizontal,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyPtBrInputFormatter()
        ]);
  }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ ${formatter.format(value / 100)}";

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
