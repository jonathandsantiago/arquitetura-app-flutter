import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTime extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final bool isReadOnly;
  final double? height;
  final String? Function(dynamic value)? validator;
  final void Function(dynamic value)? onChange;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final EdgeInsetsGeometry? paddingHorizontal;
  final DateFormat? format;

  const CustomDateTime({
    super.key,
    this.label,
    required this.controller,
    this.isReadOnly = false,
    this.height = 30,
    this.validator,
    this.onChange,
    this.padding,
    this.style,
    this.paddingHorizontal,
    this.format,
  });

  @override
  Widget build(BuildContext context) {
    var formato = format ?? DateFormat('dd/MM/yyyy');
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  label != null
                      ? Padding(
                          padding: padding ??
                              const EdgeInsets.only(left: 20.0, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              label!,
                              style: style ??
                                  ThemeApp.of(context).subtitulo.override(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeApp.of(context)
                                            .secondary
                                            .withOpacity(0.8),
                                        fontSize: 16,
                                      ),
                            ),
                          ),
                        )
                      : SizedBox.fromSize(),
                  Padding(
                    padding: paddingHorizontal ??
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                    child: SizedBox(
                      height: height,
                      child: TextFormField(
                        validator: validator,
                        controller: controller,
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              ThemeApp.of(context).secondary.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: buildInputDecoration(context, null),
                        readOnly: isReadOnly,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            controller.text = formato.format(pickedDate);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(
      BuildContext context, Widget? suffixIcon) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: ThemeApp.of(context).primary,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w700,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeApp.of(context).secondary.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeApp.of(context).secondary.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
