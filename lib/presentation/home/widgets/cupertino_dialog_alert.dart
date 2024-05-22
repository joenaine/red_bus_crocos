import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';

class CustomCupertinoDialog {
  static void call(
      {required BuildContext context,
      required String content,
      required String actionText,
      void Function()? onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(LocaleKeys.attention.tr()),
            content: Text(LocaleKeys.location_disabled.tr()),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(LocaleKeys.cancel.tr()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                onPressed: onPressed,
                child: Text(LocaleKeys.enable.tr()),
              ),
            ],
          );
        });
  }
}
