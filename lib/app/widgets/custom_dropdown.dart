import 'package:seedapp/app/core/theme_app.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final List<Map<String, dynamic>> items;
  final String titleKey;
  final String? subtitleKey;
  final String roleKey;
  final DropdownEditingController<Map<String, dynamic>>? controller;
  final bool isReadOnly;
  final double? height;
  final String? Function(dynamic value)? validator;
  final void Function(dynamic value)? onChange;
  final bool hasError;
  final String errorText;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final EdgeInsetsGeometry? paddingHorizontal;

  const CustomDropdown({
    super.key,
    this.label,
    required this.items,
    required this.titleKey,
    this.subtitleKey,
    required this.roleKey,
    this.controller,
    this.isReadOnly = false,
    this.height = 30,
    this.validator,
    this.onChange,
    required this.hasError,
    this.errorText = 'Campo obrigatório',
    this.padding,
    this.style,
    this.paddingHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return isReadOnly
        ? TextFormField(
            initialValue: controller?.value?[titleKey],
            readOnly: true,
            style: TextStyle(
              color: ThemeApp.of(context).secondary.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
            decoration: buildInputDecoration(context, null),
          )
        : IntrinsicHeight(
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
                                    const EdgeInsets.only(
                                        left: 20.0, bottom: 5),
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
                            height: hasError ? height! * 1.9 : height,
                            child: DropdownFormField<Map<String, dynamic>>(
                              controller: controller,
                              onEmptyActionPressed: () async {},
                              onSaved: (dynamic str) {},
                              onChanged: onChange,
                              findFn: (dynamic str) async => items,
                              validator: validator,
                              decoration: buildInputDecoration(
                                  context,
                                  const Icon(Icons.arrow_drop_down,
                                      color: Colors.black)),
                              displayItemFn: (dynamic item) => Text(
                                (item ?? {})[titleKey] ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: item != null
                                      ? ThemeApp.of(context)
                                          .secondary
                                          .withOpacity(0.6)
                                      : null,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              selectedFn: (dynamic item1, dynamic item2) {
                                if (item1 != null && item2 != null) {
                                  return item1[titleKey] == item2[titleKey];
                                }
                                return false;
                              },
                              filterFn: (dynamic item, str) =>
                                  item[titleKey]
                                      .toLowerCase()
                                      .indexOf(str.toLowerCase()) >=
                                  0,
                              dropdownItemFn: (dynamic item,
                                      int position,
                                      bool focused,
                                      bool selected,
                                      Function() onTap) =>
                                  ListTile(
                                title: Text(
                                  item[titleKey],
                                  style: const TextStyle(color: Colors.black),
                                ),
                                subtitle: subtitleKey != null
                                    ? Text(
                                        item[subtitleKey!] ?? '',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      )
                                    : null,
                                tileColor: focused
                                    ? const Color.fromARGB(20, 0, 0, 0)
                                    : Colors.white,
                                onTap: onTap,
                              ),
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
      errorText: hasError ? errorText : null,
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
