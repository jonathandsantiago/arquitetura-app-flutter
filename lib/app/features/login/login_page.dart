import 'package:seedapp/app/core/animations/animations.dart';
import 'package:seedapp/app/core/animations/animations_utils.dart';
import 'package:seedapp/app/core/extensions/loading_extension.dart';
import 'package:seedapp/app/core/providers/app_provider.dart';
import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/core/utils/modal_utils.dart';
import 'package:seedapp/app/features/auth/auth_store.dart';
import 'package:seedapp/app/features/login/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'widgets/login_recuperar_senha_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final AuthStore _authStore;
  late final List<Disposer> _observer;

  @override
  void initState() {
    super.initState();
    _authStore = getIt<AuthStore>();
    _observer = <Store>[
      _authStore,
    ].combineLoading();

    setupAnimations(
      AnimationsUtils.startMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _observer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeApp.of(context).primaryBackground,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 50),
                child: SvgPicture.asset(
                  'assets/images/svg/logo.svg',
                height: 160,
                  width: 160,
                  colorFilter: ColorFilter.mode(
                      ThemeApp.of(context).secondaryText, BlendMode.srcIn),
                ).animateOnPageLoad(
                    AnimationsUtils.startMap['imageOnPageLoadAnimation3']!),
              ),
              LoginFormWidget(
                onTap: (usuario, senha) async =>
                    await _authStore.loginAsync(usuario, senha),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                child: GestureDetector(
                  onTap: () => showModal(
                    context: context,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70.0),
                      topRight: Radius.circular(70.0),
                    ),
                    child: const LoginRecuperarSenhaWidget(),
                  ),
                  child: Text(
                    'Esqueceu a senha',
                    style: ThemeApp.of(context)
                        .descricaoBtn
                        .override(fontWeight: FontWeight.w600),
                  ),
                ),
              ).animateOnPageLoad(
                  AnimationsUtils.startMap['rowOnPageLoadAnimation3']!),
            ],
          ),
        ),
      ),
    );
  }
}
