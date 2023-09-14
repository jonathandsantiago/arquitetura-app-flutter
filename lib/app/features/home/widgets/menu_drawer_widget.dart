import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/features/auth/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuDrawerWidget extends StatelessWidget {
  final UsuarioModel usuario;
  final VoidCallback onTapLogout;

  const MenuDrawerWidget({
    super.key,
    required this.onTapLogout,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeApp.of(context).secondaryBackground,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: ThemeApp.of(context).secondary.withOpacity(0.3)),
              ),
            ),
            child: DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, ${usuario.nome}',
                      style: ThemeApp.of(context)
                          .titulo
                          .override(fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        usuario.email,
                        style: ThemeApp.of(context).titulo.override(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: ThemeApp.of(context).secondary.withOpacity(0.3)),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SvgPicture.asset(
                  'assets/images/svg/icons/icon_suporte.svg',
                ),
              ),
              title: Text(
                'Suporte',
                style: ThemeApp.of(context).subtitulo.override(fontSize: 17),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 25.0,
                color: ThemeApp.of(context).primaryText.withOpacity(0.7),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: ThemeApp.of(context).secondary.withOpacity(0.3)),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SvgPicture.asset(
                  'assets/images/svg/icons/icon_chat.svg',
                ),
              ),
              title: Text(
                'Chat',
                style: ThemeApp.of(context).subtitulo.override(fontSize: 17),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 25.0,
                color: ThemeApp.of(context).primaryText.withOpacity(0.7),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: ThemeApp.of(context).secondary.withOpacity(0.3)),
              ),
            ),
            child: GestureDetector(
              onTap: onTapLogout,
              child: ListTile(
                leading: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: SvgPicture.asset(
                    'assets/images/svg/icons/icon_sair.svg',
                  ),
                ),
                title: Text(
                  'Sair do App',
                  style: ThemeApp.of(context).subtitulo.override(fontSize: 17),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25.0,
                  color: ThemeApp.of(context).primaryText.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
