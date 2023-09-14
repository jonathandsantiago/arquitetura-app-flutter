import 'package:seedapp/app/core/animations/animations.dart';
import 'package:seedapp/app/core/animations/animations_utils.dart';
import 'package:seedapp/app/core/providers/app_provider.dart';
import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/features/auth/auth_store.dart';
import 'package:seedapp/app/features/auth/usuario_model.dart';
import 'package:seedapp/app/widgets/app_bar_widget.dart';
import 'package:seedapp/app/widgets/body_widget.dart';
import 'package:flutter/material.dart';

import 'home_menu_item.dart';
import 'widgets/menu_drawer_widget.dart';

class HomePage extends StatefulWidget {
  final UsuarioModel usuario;

  const HomePage({super.key, required this.usuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();
    _authStore = getIt<AuthStore>();
    setupAnimations(
      AnimationsUtils.homeMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeApp.of(context).secondaryBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        preferredSize: const Size.fromHeight(80.0), // here th
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 40.0,
              height: 40.0,
              margin: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.add_alert,
                color: ThemeApp.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, ${widget.usuario.nome}',
                style: ThemeApp.of(context).tituloHeader.override(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(widget.usuario.email,
                    style: ThemeApp.of(context).subtituloHeader),
              ),
            ],
          ),
        ),
      ),
      drawer: MenuDrawerWidget(
        usuario: widget.usuario,
        onTapLogout: () async => await _authStore.logoutAsync(),
      ),
      body: BodyWidget(
        titulo: 'Serviços',
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.75,
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
