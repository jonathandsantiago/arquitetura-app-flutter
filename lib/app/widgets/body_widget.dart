import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final String? titulo;

  const BodyWidget({super.key, required this.child, this.padding, this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          titulo != null
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 25, bottom: 10, right: 20),
                  child: Text(
                    titulo!,
                    style: ThemeApp.of(context).titulo.override(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                )
              : SizedBox.fromSize(),
          child
        ],
      ),
    );
  }
}
