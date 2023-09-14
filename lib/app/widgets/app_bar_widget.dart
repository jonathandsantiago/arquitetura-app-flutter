import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool? enablePop;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? scrolledUnderElevation;
  final VoidCallback? onTap;

  @override
  final Size preferredSize;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.preferredSize,
    this.actions,
    this.enablePop,
    this.bottom,
    this.scrolledUnderElevation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0), // here the desired height
      child: AppBar(
        iconTheme: const IconThemeData(size: 45),
        leading: enablePop != null && enablePop!
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35.0,
                ),
                onPressed: () => onTap != null ? onTap!() : context.pop(),
              )
            : null,
        backgroundColor: Colors.transparent,
        title: title,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            gradient: LinearGradient(colors: [
              ThemeApp.of(context).primaryBackground,
              ThemeApp.of(context).primaryBackground
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        elevation: 0.0,
        scrolledUnderElevation: scrolledUnderElevation,
        centerTitle: false,
        actions: actions,
        bottom: bottom,
      ),
    );
  }
}
