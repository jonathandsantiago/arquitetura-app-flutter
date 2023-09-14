import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeMenuItemWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const HomeMenuItemWidget({
    super.key,
    required this.image,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Container(
                width: 140.0,
                height: 140.0,
                color: ThemeApp.of(context).primary,
                child: SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                      ThemeApp.of(context).icon, BlendMode.srcIn),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: ThemeApp.of(context).subtitulo,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
