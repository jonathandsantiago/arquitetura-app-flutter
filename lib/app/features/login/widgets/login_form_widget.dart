import 'package:seedapp/app/core/animations/animations.dart';
import 'package:seedapp/app/core/animations/animations_utils.dart';
import 'package:seedapp/app/core/theme_app.dart';
import 'package:seedapp/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  final Function onTap;

  const LoginFormWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                controller: emailController,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF4C4C81),
                    prefixIcon: const Icon(Icons.person_rounded),
                    labelStyle: const TextStyle(
                      color: Colors.white,
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
                    labelText: "Usuário"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Usuário é obrigatório.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_reset),
                    filled: true,
                    fillColor: const Color(0xFF4C4C81),
                    iconColor: Colors.white,
                    focusColor: Colors.white,
                    labelStyle: const TextStyle(
                      color: Colors.white,
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
                    labelText: "Senha"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha é obrigatória.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              onTap(emailController.text,
                                  passwordController.text);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Por favor, preencha todos os campos obrigatórios.')),
                              );
                            }
                          },
                          text: 'Login',
                          options: ButtonWidgetOptions(
                            width: 130.0,
                            height: 55.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: ThemeApp.of(context).primary,
                            textStyle: ThemeApp.of(context).tituloButton,
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ).animateOnPageLoad(AnimationsUtils
                            .startMap['buttonOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
