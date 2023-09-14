import 'package:flutter/material.dart';

class InfoItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? valueTextStyle;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;

  const InfoItemWidget({
    super.key,
    required this.label,
    required this.value,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.valueTextStyle,
    this.padding,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            label,
            style: labelStyle ??
                Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      fontSize: 14,
                    ),
          ),
          Flexible(
            child: Text(
              ' $value',
              style: valueTextStyle ??
                  Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fontSize: 14,
                      ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
