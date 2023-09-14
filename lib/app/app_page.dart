import 'package:seedapp/app/features/auth/auth_store.dart';
import 'package:seedapp/app/features/home/home_page.dart';
import 'package:seedapp/app/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import 'core/internationalization.dart';
import 'core/providers/app_provider.dart';
import 'features/auth/usuario_model.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => AppPageState();

  static AppPageState of(BuildContext context) =>
      context.findAncestorStateOfType<AppPageState>()!;
}

class AppPageState extends State<AppPage> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  late AuthStore _authStore;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authStore = getIt<AuthStore>();
    _router = GoRouter(
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return TripleBuilder<AuthStore, UsuarioModel>(
              store: _authStore,
              builder: (_, value) => value.state.isAuthenticate
                  ? HomePage(usuario: value.state)
                  : const LoginPage(),
            );
          },
          routes: const <RouteBase>[
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp.router(
        title: 'Projeto base arquiterura app',
        localizationsDelegates: const [
          InternationalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('pt', '')],
        theme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        routerConfig: _router,
        builder: (context, child) {
          final scale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              child: FlutterEasyLoading(child: child));
        },
      ),
    );
  }
}
