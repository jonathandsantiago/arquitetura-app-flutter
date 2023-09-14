import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/widgets/app_bar_widget.dart';
import 'package:seedapp/app/widgets/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'fila_item_widget.dart';

class FilaWidget extends StatelessWidget {
  final String titulo;
  final List<FilaItemWidget> children;
  final List<Widget>? actions;
  final ValueChanged<String>? onPesquisar;
  final RefreshCallback onRefresh;

  const FilaWidget({
    super.key,
    required this.children,
    required this.titulo,
    required this.onRefresh,
    this.actions,
    this.onPesquisar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.of(context).secondaryBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        onTap: () => context.pop(true),
        preferredSize: const Size.fromHeight(80.0),
        enablePop: true,
        title: Text(
          titulo,
          style: ThemeApp.of(context).tituloHeader,
        ),
        actions: actions,
      ),
      body: BodyWidget(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.77,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    onChanged: onPesquisar,
                    style: TextStyle(
                      color: ThemeApp.of(context).secondary.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ThemeApp.of(context).primary,
                      labelText: 'Pesquisar',
                      suffixIcon: Icon(
                        Icons.search,
                        color: ThemeApp.of(context).secondary.withOpacity(0.2),
                        size: 30,
                      ),
                      labelStyle: ThemeApp.of(context).titulo.override(
                            color:
                                ThemeApp.of(context).secondary.withOpacity(0.4),
                          ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              ThemeApp.of(context).secondary.withOpacity(0.2),
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
                      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              ThemeApp.of(context).secondary.withOpacity(0.2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: ThemeApp.of(context).secondary.withOpacity(0.8),
                  height: 1,
                ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
