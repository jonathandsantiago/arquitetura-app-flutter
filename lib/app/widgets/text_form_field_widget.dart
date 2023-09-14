import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final bool? readOnly;
  final Widget? icon;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? paddingHorizontal;
  final TextInputType? keyboardType;

  const TextFormFieldWidget({
    super.key,
    this.label,
    this.validator,
    this.readOnly,
    this.initialValue,
    this.icon,
    this.inputFormatters,
    this.padding,
    this.maxLines,
    this.style,
    this.controller,
    this.paddingHorizontal,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
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
                    padding: paddingHorizontal ?? const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      keyboardType: keyboardType ?? TextInputType.text,
                      controller: controller,
                      readOnly: readOnly ?? false,
                      initialValue: initialValue,
                      inputFormatters: inputFormatters,
                      maxLines: maxLines,
                      style: TextStyle(
                        color: ThemeApp.of(context).secondary.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
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
                            color:
                                ThemeApp.of(context).secondary.withOpacity(0.2),
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
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                ThemeApp.of(context).secondary.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: validator,
                    ),
                  ),
                ],
              ),
            ),
          ),
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10.0),
                  child: icon!,
                )
              : SizedBox.fromSize()
        ],
      ),
    );
  }
}
