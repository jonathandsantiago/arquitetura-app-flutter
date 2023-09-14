import 'package:seedapp/app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DateStringFormFieldWidget extends StatefulWidget {
  final String format;
  final bool useCurrentDate;
  final String? label;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;
  final TextEditingController? dateController;
  final EdgeInsetsGeometry? paddingHorizontal;

  const DateStringFormFieldWidget({
    Key? key,
    required this.format,
    this.useCurrentDate = false,
    this.label,
    this.validator,
    this.readOnly,
    this.icon,
    this.padding,
    this.maxLines,
    this.style,
    this.controller,
    this.dateController,
    this.paddingHorizontal,
  }) : super(key: key);

  @override
  DateStringFormFieldWidgetState createState() =>
      DateStringFormFieldWidgetState();
}

class DateStringFormFieldWidgetState extends State<DateStringFormFieldWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(_onTextChanged);
    }
  }

  void _onTextChanged() {
    if (widget.controller == null || widget.dateController == null) return;

    String text = widget.controller!.text;

    DateTime? date;
    if (widget.format == "MM/yyyy") {
      date = DateTime.tryParse("01/$text");
    } else if (widget.format == "dd/MM/yyyy") {
      date = DateTime.tryParse(text);
    } else if (widget.format == "dd") {
      widget.dateController!.text = text;
      return;
    } else if (widget.format == "MM") {
      widget.dateController!.text = text;
      return;
    } else if (widget.format == "yyyy") {
      widget.dateController!.text = text;
      return;
    }

    if (date != null) {
      widget.dateController!.text = DateFormat("yyyy-MM-dd").format(date);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller != null &&
        widget.controller!.text.isEmpty &&
        widget.useCurrentDate) {
      final now = DateTime.now();
      final formatter = DateFormat(widget.format);
      widget.controller!.text = formatter.format(now);
    }

    bool isValidDate(String date, String format) {
      try {
        // final formatter = DateFormat(format);
        // final result = formatter.parseStrict(date);
        return true;
      } catch (e) {
        return false;
      }
    }

    return TextFormFieldWidget(
      label: widget.label,
      validator: (value) {
        if (widget.validator != null) {
          final validationResult = widget.validator!(value);
          if (validationResult != null) {
            return validationResult;
          }
        }

        if (!isValidDate(value!, widget.format)) {
          return 'Data inválida!';
        }
        return null;
      },
      readOnly: widget.readOnly,
      icon: widget.icon,
      padding: widget.padding,
      maxLines: widget.maxLines,
      style: widget.style,
      controller: widget.controller,
      paddingHorizontal: widget.paddingHorizontal,
      inputFormatters: [DateFormatInputFormatter(format: widget.format)],
    );
  }
}

class DateFormatInputFormatter extends TextInputFormatter {
  final String format;

  DateFormatInputFormatter({required this.format});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text
        .replaceAll(RegExp(r'[^0-9]'), ''); // Remove non-digit characters
    String formattedText = '';

    int j = 0;
    for (int i = 0; i < format.length && j < newText.length; i++) {
      if (format[i] == 'M' || format[i] == 'd' || format[i] == 'y') {
        formattedText += newText[j];
        j++;
      } else {
        formattedText += format[i];
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
