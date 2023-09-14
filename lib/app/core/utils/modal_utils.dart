import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future showModal({
  required BuildContext context,
  required Widget child,
  String? title,
  Widget? header,
  bool isScrollControlled = false,
  bool useRootNavigator = true,
  AnimationController? transitionAnimationController,
  double? height,
  Color? backgroundColor,
  BorderRadiusGeometry? borderRadius,
  TextStyle? titleStyle,
}) {
  return showModalBottomSheet(
    elevation: 0,
    context: context,
    useRootNavigator: useRootNavigator,
    backgroundColor: backgroundColor ?? ThemeApp.of(context).primary,
    transitionAnimationController: transitionAnimationController,
    isScrollControlled: isScrollControlled,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(7.0),
            topRight: Radius.circular(7.0),
          ),
    ),
    builder: (BuildContext context) {
      var heightFactor = height ?? 0.9;
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: FractionallySizedBox(
          heightFactor: MediaQuery.of(context).viewInsets.bottom > 0
              ? heightFactor + 0.1
              : heightFactor,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: title != null || header != null ? 50 : 25,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 6, bottom: 10),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: ThemeApp.of(context).primaryBtnText),
                        ),
                      ),
                      title != null && header == null
                          ? Center(
                              child: Text(
                                title,
                                style: titleStyle ??
                                    ThemeApp.of(context).descricao,
                              ),
                            )
                          : header ?? Container(),
                    ],
                  ),
                ),
                child
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future showDialogWidget<T>({
  required BuildContext context,
  required Widget child,
  required String title,
  double? height,
  List<Widget>? actions,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: ThemeApp.of(context).primary,
      elevation: 0,
      actionsPadding: const EdgeInsets.only(bottom: 10),
      contentPadding:
          const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      content: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: ThemeApp.of(context)
                          .subtitulo
                          .override(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        width: 2,
                        color: ThemeApp.of(context).secondary,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context, null),
                      child: Icon(
                        Icons.close,
                        color: ThemeApp.of(context).secondary,
                      ),
                    ),
                  )
                ],
              ),
              child
            ],
          ),
        ),
      ),
      actions: actions,
    ),
  );
}

Future showDialogAlert({
  required BuildContext context,
  String? message,
  Widget? child,
  double? height,
  String? titleAction,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: ThemeApp.of(context).primary,
      elevation: 0,
      actionsPadding: const EdgeInsets.only(bottom: 10),
      contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      content: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.18,
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                'assets/lottie_animations/lottie_checked.json',
                width: 100,
                height: 100,
              ),
            ),
            child ??
                Center(
                  child: message != null
                      ? Text(
                          message,
                          style: ThemeApp.of(context).titulo,
                        )
                      : const SizedBox.shrink(),
                )
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            style: TextButton.styleFrom(
              backgroundColor: ThemeApp.of(context).primaryColorBtn,
              fixedSize: const Size(170, 40),
            ),
            child: Text(
              titleAction ?? 'OK',
              style: ThemeApp.of(context).descricaoBtn.override(fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}
