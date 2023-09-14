import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilaItemWidget extends StatelessWidget {
  final String icon;
  final String titulo;
  final String subtitulo;
  final String? descricao;
  final VoidCallback onTap;
  final double height;

  const FilaItemWidget({
    super.key,
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    required this.onTap,
    required this.height,
    this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ThemeApp.of(context).secondary.withOpacity(0.3),
              width: 1.0,
            ),
          ),
        ),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titulo,
                          maxLines: 2,
                          style: ThemeApp.of(context).titulo.override(
                                fontSize: 16,
                                color: ThemeApp.of(context).secondary,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            subtitulo,
                            softWrap: true,
                            style: ThemeApp.of(context).subtitulo.override(
                                  color: ThemeApp.of(context)
                                      .secondary
                                      .withOpacity(0.3),
                                ),
                          ),
                        ),
                        descricao != null
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  descricao!,
                                  softWrap: true,
                                  style:
                                      ThemeApp.of(context).subtitulo.override(
                                            fontSize: 11,
                                            color: ThemeApp.of(context)
                                                .primaryColorBtn,
                                          ),
                                ),
                              )
                            : SizedBox.fromSize(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 25.0,
                      color: ThemeApp.of(context).primaryText.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
