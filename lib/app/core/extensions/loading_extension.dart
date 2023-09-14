import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_triple/flutter_triple.dart';

extension ObservableLoading on List<Store> {
  List<Disposer> combineLoading() {
    List<Disposer> disposers = [];
    for (var i = 0; i < length; i++) {
      bool isLoading = false;
      var disposer = this[i].observer(
        onLoading: (loading) async {
          try {
            if (loading && !isLoading) {
              isLoading = true;
              await EasyLoading.show(
                status: 'Carregando...',
                maskType: EasyLoadingMaskType.black,
              );
            } else {
              isLoading = false;
              await EasyLoading.dismiss();
            }
          } catch (e) {
            debugPrint("$e");
          }
        },
        onError: (error) async {
          EasyLoading.showError('Erro ao carregar dados');
          await EasyLoading.dismiss();
        },
      );

      disposers.add(disposer);
    }

    return disposers;
  }
}

extension ObservableDispose on List<Disposer> {
  void dispose() {
    for (var disposer in this) {
      disposer();
    }
  }
}
