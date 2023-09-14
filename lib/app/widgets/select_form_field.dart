import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectItem<T> {
  final T? key;
  final String description;

  const SelectItem({this.key, required this.description});
}

class SelectFormField<T> extends StatelessWidget {
  final String? labelText;
  final SelectItem<T>? value;
  final bool? enabled;
  final List<SelectItem<T>> itens;
  final ValueChanged<SelectItem<T>?> onChanged;
  final FormFieldValidator<String>? validator;
  final String? svgPath;
  final EdgeInsetsGeometry? padding;

  const SelectFormField(
      {Key? key,
      required this.itens,
      required this.onChanged,
      this.labelText,
      this.validator,
      this.value,
      this.enabled,
      this.padding,
      this.svgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectItem<T> defaultValue = itens.first;
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
                  labelText != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                if (svgPath != null)
                                  SvgPicture.asset(
                                    svgPath!,
                                    width: 30,
                                    height: 30,
                                  ),
                                const SizedBox(width: 8.0),
                                Text(
                                  labelText!,
                                  style: ThemeApp.of(context).titulo.override(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.fromSize(),
                  Padding(
                    padding: padding ??
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                    child: DropdownButtonFormField<SelectItem<T>>(
                      icon: Icon(
                        Icons.expand_more,
                        color: ThemeApp.of(context).secondary,
                      ),
                      isDense: true,
                      dropdownColor: ThemeApp.of(context).primary,
                      items: itens.map((item) {
                        return DropdownMenuItem<SelectItem<T>>(
                          value: item,
                          child: Text(item.description),
                        );
                      }).toList(),
                      onChanged: onChanged,
                      value: defaultValue,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                        filled: true,
                        fillColor: ThemeApp.of(context).primary,
                        labelStyle: TextStyle(
                          color: ThemeApp.of(context).secondary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                ThemeApp.of(context).secondary.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                ThemeApp.of(context).secondary.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: TextStyle(
                        color: ThemeApp.of(context).secondary,
                      ),
                      validator: validator != null
                          ? (value) {
                              return validator!(value!.description);
                            }
                          : null,
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
}
