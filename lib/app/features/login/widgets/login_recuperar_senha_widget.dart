import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/core/utils/modal_utils.dart';
import 'package:flutter/material.dart';

class LoginRecuperarSenhaWidget extends StatefulWidget {
  const LoginRecuperarSenhaWidget({super.key});

  @override
  State<LoginRecuperarSenhaWidget> createState() =>
      _LoginRecuperarSenhaWidgetState();
}

class _LoginRecuperarSenhaWidgetState extends State<LoginRecuperarSenhaWidget> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Text(
              'Esqueceu a sua senha?',
              style: ThemeApp.of(context).descricao.override(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: ThemeApp.of(context).primaryText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextFormField(
              controller: emailController,
              style: ThemeApp.of(context).descricao.override(fontSize: 16),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeApp.of(context).secondaryBackground,
                  labelStyle: TextStyle(
                    color: ThemeApp.of(context).secondary,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Usuário é obrigatório.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ThemeApp.of(context).primaryText, // background
                    foregroundColor: ThemeApp.of(context).primary, // foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showDialogAlert(
                        context: context,
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: Column(
                          children: [
                            Text(
                              'Enviado e-mail',
                              style: ThemeApp.of(context).titulo,
                            ),
                            Text(
                              'de',
                              style: ThemeApp.of(context).titulo,
                            ),
                            Text(
                              'recuperação com sucesso!',
                              style: ThemeApp.of(context).titulo,
                            )
                          ],
                        ));
                  },
                  child: Text(
                    'Enviar',
                    style: ThemeApp.of(context).subtitulo.override(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: ThemeApp.of(context).primary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
